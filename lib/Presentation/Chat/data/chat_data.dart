// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keep_n_touch/Core/Models/msg_model.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';

class ChatData {
  ChatData._();

  static final firebaseStore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static final FirebaseStorage storage = FirebaseStorage.instance;

  static Future createChatRoom(
      {required String email, required BuildContext context}) async {
    final contactEmailUser = await firebaseStore
        .collection(AppStrings.usersCollection)
        .where('email', isEqualTo: '$email${AppStrings.defaultEmail}')
        .get();
    if (contactEmailUser.docs.isNotEmpty) {
      final contactId = contactEmailUser.docs.first['id'];
      final contactPhoto = contactEmailUser.docs.first['photo'];
      final contactName = contactEmailUser.docs.first['name'];

      final String userId = FirebaseAuth.instance.currentUser!.uid;
      final List<String> roomId = [userId, contactId]
        ..sort((a, b) => a.compareTo(b));

      final checkRoom = await firebaseStore
          .collection(AppStrings.chatCollection)
          .where('members', isEqualTo: roomId)
          .get();
      if (checkRoom.docs.isEmpty) {
        final String createdAtTime =
            DateTime.now().millisecondsSinceEpoch.toString();
        RoomModel roomModel = RoomModel(
          id: roomId.toString(),
          createdAt: createdAtTime,
          lastMessage: "",
          lastMessageTime: "",
          members: roomId,
          senderId: auth.currentUser!.uid,
          senderName: auth.currentUser!.displayName,
          senderPhoto: auth.currentUser!.photoURL ?? "",
          contactId: contactId,
          contactName: contactName,
          contactPhoto: contactPhoto,
        );
        await firebaseStore
            .collection(AppStrings.chatCollection)
            .doc(roomId.toString())
            .set(roomModel.toMap())
            .whenComplete(() => CustomLoading.toast('Chat created'));
      }
    } else {
      CustomLoading.toast('No User Found');
    }
  }

  static Stream<List<RoomModel>> getRooms() {
    return firebaseStore
        .collection(AppStrings.chatCollection)
        .where('members', arrayContains: auth.currentUser!.uid)
        .snapshots()
        .map(
      (value) {
        return value.docs.map(
          (e) {
            final data = e.data();
            return RoomModel(
              createdAt: data['createdAt'],
              id: data['id'],
              lastMessage: data['lastMessage'],
              lastMessageTime: data['lastMessageTime'],
              members: data['members'],
              contactId: data['contactId'],
              contactName: data['contactName'],
              contactPhoto: data['contactPhoto'],
              senderId: data['senderId'],
              senderName: data['senderName'],
              senderPhoto: data['senderPhoto'],
            );
          },
        ).toList();
      },
    );
  }

  static Future sendMessage({
    required String msg,
    required String contactId,
    required String contactName,
    required String roomId,
    bool? isText,
  }) async {
    final String userId = FirebaseAuth.instance.currentUser!.uid;
    final String createdAtTime =
        DateTime.now().millisecondsSinceEpoch.toString();
    MessageModel messageModel = MessageModel(
      createdAt: createdAtTime,
      id: createdAtTime,
      message: msg,
      contactId: contactId,
      senderId: userId,
      isText: isText ?? true,
      isRead: false,
      contactName: contactName,
      senderName: auth.currentUser!.displayName,
    );

    await firebaseStore
        .collection(AppStrings.chatCollection)
        .doc(roomId)
        .collection(AppStrings.messagesCollection)
        .doc(createdAtTime)
        .set(messageModel.toMap());
  }

  static Stream<List<MessageModel>> getMessages({required String roomId}) {
    return firebaseStore
        .collection(AppStrings.chatCollection)
        .doc(roomId)
        .collection(AppStrings.messagesCollection)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
      (value) {
        return value.docs.map(
          (e) {
            final data = e.data();
            return MessageModel(
              contactId: data['contactId'],
              contactName: data['contactName'],
              createdAt: data['createdAt'],
              id: data['id'],
              isRead: data['isRead'],
              message: data['message'],
              senderId: data['senderId'],
              senderName: data['senderName'],
              isText: data['isText'],
            );
          },
        ).toList();
      },
    );
  }

  static Future sendImage(
      {required String roomId,
      required String contactId,
      required String contactName}) async {
    ImagePicker imagePicker = ImagePicker();

    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      uploadImage(
        file: File(image.path),
        roomId: roomId,
        contactId: contactId,
        contactName: contactName,
      );
    }
  }

  static Future uploadImage({
    required File file,
    required String roomId,
    required String contactId,
    required String contactName,
  }) async {
    final String imagePath = file.path.split('.').last;

    final ref = storage
        .ref('MessageImages')
        .child('$roomId/${DateTime.now().millisecondsSinceEpoch}.$imagePath');
    CustomLoading.show('Sending');
    await ref.putFile(file);
    CustomLoading.dismiss();
    final String imageUrl = await ref.getDownloadURL();
    sendMessage(
      msg: imageUrl,
      contactId: contactId,
      contactName: contactName,
      isText: false,
      roomId: roomId,
    );
    // ignore: avoid_print
    print('Image = $imageUrl');
  }

  static Future isReadMessage(
      {required String roomId, required String msgId}) async {
    await firebaseStore
        .collection(AppStrings.chatCollection)
        .doc(roomId)
        .collection(AppStrings.messagesCollection)
        .doc(msgId)
        .update({'isRead': true});
  }
}
