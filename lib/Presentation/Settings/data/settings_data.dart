import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';

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
}
