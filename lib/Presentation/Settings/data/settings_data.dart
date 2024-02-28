import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/login_view.dart';

class SettingsData {
  SettingsData._();

  static final FirebaseStorage storage = FirebaseStorage.instance;
  static final firebaseStore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;

  static Future setProfileImage({
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

  static Future uploadImage({
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
    CustomLoading.toast('Success, Please refresh the page');
    // ignore: avoid_print
    print('Image = $imageUrl');
  }

  static Future changeUser({required String userName}) async {
    CustomLoading.show();
    await auth.currentUser!.updateDisplayName(userName);
    await firebaseStore
        .collection(AppStrings.usersCollection)
        .doc(auth.currentUser!.uid)
        .update({'name': userName}).whenComplete(
            () => CustomLoading.toast('Success, $userName updated'));
  }

  static Future changePassword(BuildContext context,
      {required String password}) async {
    CustomLoading.show();
    await auth.currentUser!
        .updatePassword(password)
        .whenComplete(
            () => CustomLoading.toast('Password Changed Successfully'))
        .then((value) {
      auth.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginView(),
      ));
      CustomLoading.toast('Logged out, Please log in again');
    });
  }

  static Future changeEmail({required String email}) async {
    CustomLoading.show();
    await auth.currentUser!.verifyBeforeUpdateEmail(email);
    await firebaseStore
        .collection(AppStrings.usersCollection)
        .doc(auth.currentUser!.uid)
        .update({'email': email}).whenComplete(
            () => CustomLoading.toast('Success, $email updated'));
  }
}
