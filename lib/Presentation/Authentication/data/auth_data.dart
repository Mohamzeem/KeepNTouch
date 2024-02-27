import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:keep_n_touch/Core/Models/user_model.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/complete_register_view.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/login_view.dart';
import 'package:keep_n_touch/Presentation/Control/view/control_view.dart';

class AuthData {
  AuthData._();

  static final fireStore = FirebaseFirestore.instance;
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static User? get user => auth.currentUser!;
  static Stream<User?> get userStream => auth.userChanges();
  static UserModel? userModel;
  static bool isFirstTime = true;

  static Future logIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      CustomLoading.show();
      await auth
          .signInWithEmailAndPassword(
        email: '${email.trim()}${AppStrings.defaultEmail}',
        password: password,
      )
          .whenComplete(() {
        CustomLoading.dismiss();
        if (FirebaseAuth.instance.currentUser!.displayName == "" ||
            FirebaseAuth.instance.currentUser!.displayName == null ||
            FirebaseAuth.instance.currentUser!.displayName!.isEmpty) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CompleteRegisterView(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ControlView(),
          ));
        }
      }).then(
        (value) {
          CustomLoading.toast('Success, Welcome ${value.user!.displayName!}');
        },
      ).onError(
        (error, stackTrace) {
          if (error.toString() == 'Null check operator used on a null value') {
            CustomLoading.toast('Wrong email or password');
          } else {
            CustomLoading.toast(error.toString());
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomLoading.toast('No user found for that email');
      } else if (e.code == 'wrong-password') {
        CustomLoading.toast('Wrong password provided for that user');
      }
    } catch (e) {
      CustomLoading.toast(e.toString());
    }
  }

  static Future register(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      CustomLoading.show();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: '${email.trim()}${AppStrings.defaultEmail}',
            password: password,
          )
          .whenComplete(() {
            CustomLoading.dismiss();
            if (FirebaseAuth.instance.currentUser!.displayName == "" ||
                FirebaseAuth.instance.currentUser!.displayName == null ||
                FirebaseAuth.instance.currentUser!.displayName!.isEmpty) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CompleteRegisterView(),
              ));
            }
          })
          .then(
            (value) =>
                CustomLoading.toast('Success, Please complete registration'),
          )
          .onError(
              (error, stackTrace) => CustomLoading.toast(error.toString()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomLoading.toast('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        CustomLoading.toast('The account already exists for that email');
      }
    } catch (e) {
      CustomLoading.toast(e.toString());
    }
  }

  static Future saveUserData(
      {required String name, required BuildContext context}) async {
    CustomLoading.show();
    await auth.currentUser!.updateDisplayName(name);
    //String? token = await FirebaseMessaging.instance.getToken();
    UserModel userModel = UserModel(
      name: name,
      id: auth.currentUser!.uid,
      email: auth.currentUser!.email,
    );
    await fireStore
        .collection(AppStrings.usersCollection)
        .doc(auth.currentUser!.uid)
        .set(userModel.toJson())
        .whenComplete(() {
          CustomLoading.dismiss();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginView(),
          ));
        })
        .then((value) =>
            CustomLoading.toast('Account created successfully, please log in'))
        .onError((error, stackTrace) => CustomLoading.toast(error.toString()));
  }

  static Future<UserModel> getProfile() async {
    final result = await fireStore
        .collection(AppStrings.usersCollection)
        .doc(auth.currentUser!.uid)
        .get();
    final profile = UserModel.fromJson(result.data()!);
    await auth.currentUser!.updatePhotoURL(profile.photo);

    return profile;
  } //~ update user status in firebase

  static Future signOut({required BuildContext context}) async {
    CustomLoading.show();
    await auth
        .signOut()
        .whenComplete(() {
          CustomLoading.dismiss();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ));
        })
        .then((value) => CustomLoading.toast('Logged Out Successfully'))
        .onError(
          (error, stackTrace) => CustomSnackBar.showErrorSnackBar(
              context: context, message: error.toString()),
        );
  }

  static Future resetPassword(
      {required String email, required BuildContext context}) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(
            email: '${email.trim()}${AppStrings.defaultEmail}')
        .then(
          (value) => CustomSnackBar.showSuccessSnackBar(
                  context: context,
                  message: 'Email sent Successfully, Check your email')
              .then((value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                  (route) => false)),
        )
        .onError(
          (error, stackTrace) => CustomSnackBar.showErrorSnackBar(
              context: context, message: error.toString()),
        );
  }

  static void checkInternet(BuildContext context) {
    InternetConnectionChecker().onStatusChange.listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          if (isFirstTime) {
            isFirstTime = false;
            return;
          }
          CustomLoading.toast('Internet connection is active');
          break;
        case InternetConnectionStatus.disconnected:
          CustomLoading.toast('Internet connection is disconnected');
          break;
      }
    });
  }
}
