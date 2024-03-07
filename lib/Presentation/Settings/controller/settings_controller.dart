import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keep_n_touch/Core/Models/user_model.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/login_view.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_states.dart';

class SettingsController extends GetxController {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final firebaseStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final states = SettingsStates();

  @override
  void onInit() {
    super.onInit();
    _getProfile();
    // profile;
    print('object');
  }

  @override
  void dispose() {
    nameController.dispose();
    nameController.clear();
    passwordController.dispose();
    passwordController.clear();
    super.dispose();
  }

  // UserModel get profile => states.userModel.value;
  // set profile(UserModel value) {
  //   states.userModel.value = value;
  //   update();
  // }

  String get newName => states.userName.value;
  set newName(String value) {
    states.userName.value = value;
    update();
  }

  String get newPhoto => states.userPhoto.value;
  set newPhoto(String value) {
    states.userPhoto.value = value;
    update();
  }

  Future<UserModel> _getProfile() async {
    final result = await firebaseStore
        .collection(AppStrings.usersCollection)
        .doc(auth.currentUser!.uid)
        .get();
    final user = UserModel.fromJson(result.data()!);
    newName = user.name!;
    newPhoto = user.photo!;
    states.userModel.value = user;
    return user;
  }

  Future setProfileImage({
    required String userId,
  }) async {
    ImagePicker imagePicker = ImagePicker();

    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      uploadImage(
        file: File(image.path),
        userId: userId,
      );
    }
  }

  Future uploadImage({
    required File file,
    required String userId,
  }) async {
    final String imagePath = file.path.split('.').last;

    final ref = storage
        .ref('ProfileImages')
        .child('$userId/${DateTime.now().millisecondsSinceEpoch}.$imagePath');
    CustomLoading.show();
    await ref.putFile(file);
    final String imageUrl = await ref.getDownloadURL();

    await auth.currentUser!.updatePhotoURL(imageUrl);
    await firebaseStore
        .collection(AppStrings.usersCollection)
        .doc(userId)
        .update({'photo': imageUrl});
    CustomLoading.toast(
        text: 'Success, Please refresh the page',
        toastPosition: EasyLoadingToastPosition.bottom);
    // ignore: avoid_print
    print('Image = $imageUrl');
  }

  Future _changeUserName({required String userName}) async {
    CustomLoading.show();
    await auth.currentUser!.updateDisplayName(userName);
    await firebaseStore
        .collection(AppStrings.usersCollection)
        .doc(auth.currentUser!.uid)
        .update({'name': userName})
        .then((value) => _getProfile())
        .whenComplete(() {
          CustomLoading.toast(text: 'Success, $userName updated');
        });
  }

  void changeUserNameFunction(BuildContext context) {
    if (nameController.text.isEmpty) {
      CustomLoading.toast(
          text: 'Please enter a your user name',
          toastPosition: EasyLoadingToastPosition.center);
    } else {
      _changeUserName(userName: nameController.text);
      Navigator.pop(context);
      nameController.clear();
    }
  }

  Future changePassword(BuildContext context,
      {required String password}) async {
    CustomLoading.show();
    await auth.currentUser!
        .updatePassword(password)
        .whenComplete(
            () => CustomLoading.toast(text: 'Password Changed Successfully'))
        .then((value) {
      auth.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginView(),
      ));
      CustomLoading.toast(text: 'Logged out, Please log in again');
    });
  }

  Future changeEmail({required String email}) async {
    CustomLoading.show();
    await auth.currentUser!.verifyBeforeUpdateEmail(email);
    await firebaseStore
        .collection(AppStrings.usersCollection)
        .doc(auth.currentUser!.uid)
        .update({'email': email}).whenComplete(
            () => CustomLoading.toast(text: 'Success, $email updated'));
  }
}
