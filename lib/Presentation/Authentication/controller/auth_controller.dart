import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:keep_n_touch/Core/Models/user_model.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Presentation/Authentication/controller/auth_states.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/complete_register_view.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/login_view.dart';
import 'package:keep_n_touch/Presentation/Home/view/home_view.dart';

class AuthController extends GetxController {
  AuthController();

  final fireStore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => auth.currentUser!;
  Stream<User?> get userStream => auth.userChanges();

  final states = AuthStates();

  @override
  void onInit() {
    super.onInit();
    _getProfile();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  UserModel get profile => states.userModel.value;
  set profile(UserModel value) {
    states.userModel.value = value;
    update();
  }

  Future logIn(
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
            builder: (context) => const HomeView(),
          ));
        }
      }).then(
        (value) {
          CustomLoading.toast(
              text: 'Success, Welcome ${value.user!.displayName!}');
        },
      ).onError(
        (error, stackTrace) {
          if (error.toString() == 'Null check operator used on a null value') {
            CustomLoading.toast(text: 'Wrong email or password');
          } else {
            CustomLoading.toast(text: error.toString());
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomLoading.toast(text: 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        CustomLoading.toast(text: 'Wrong password provided for that user');
      }
    } catch (e) {
      CustomLoading.toast(text: e.toString());
    }
  }

  Future register(
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
            (value) => CustomLoading.toast(
                text: 'Success, Please complete registration'),
          )
          .onError((error, stackTrace) =>
              CustomLoading.toast(text: error.toString()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomLoading.toast(text: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        CustomLoading.toast(text: 'The account already exists for that email');
      }
    } catch (e) {
      CustomLoading.toast(text: e.toString());
    }
  }

  Future saveUserData(
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
        .then((value) => CustomLoading.toast(
            text: 'Account created successfully, please log in'))
        .onError(
            (error, stackTrace) => CustomLoading.toast(text: error.toString()));
  }

  Future<UserModel> _getProfile() async {
    final result = await fireStore
        .collection(AppStrings.usersCollection)
        .doc(auth.currentUser!.uid)
        .get();
    final user = UserModel.fromJson(result.data()!);
    profile = user;
    await auth.currentUser!.updatePhotoURL(user.photo);
    await auth.currentUser!.updateDisplayName(user.name);
    return user;
  } //~ update user status in firebase

  Future signOut({required BuildContext context}) async {
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
        .then((value) => CustomLoading.toast(text: 'Logged Out Successfully'))
        .onError(
          (error, stackTrace) => CustomSnackBar.showErrorSnackBar(
              context: context, message: error.toString()),
        );
  }

  Future resetPassword(
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

  void checkInternet(BuildContext context) {
    InternetConnectionChecker().onStatusChange.listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          if (states.isFirstTime) {
            states.isFirstTime = false;
            return;
          }
          CustomLoading.toast(text: 'Internet connection is active');
          break;
        case InternetConnectionStatus.disconnected:
          CustomLoading.toast(text: 'Internet connection is disconnected');
          break;
      }
    });
  }
}
