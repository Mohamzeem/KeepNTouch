// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keep_n_touch/Core/Models/msg_model.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';

class ChatApi {
  final firebaseStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final String createdAtTime =
      DateFormat('dd/MM/yyyy, HH:mm:ss aaa').format(DateTime.now()).toString();
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  Future createChatRoom(
      {required String email, required BuildContext context}) async {
    final contactEmail = await firebaseStore
        .collection(AppStrings.usersCollection)
        .where('email', isEqualTo: email)
        .get();
    if (contactEmail.docs.isNotEmpty) {
      // ContactModel contactDetails =
      // ContactModel.fromJson(contactEmail.docs!.first);
      // final contactIdd = contactDetails.first.id;

      final contactId = contactEmail.docs.first.id;

      List<String> roomId = [userId, contactId]..sort((a, b) => a.compareTo(b));

      final checkRoom = await firebaseStore
          .collection(AppStrings.chatCollection)
          .where('members', isEqualTo: roomId)
          .get();
      if (checkRoom.docs.isEmpty) {
        RoomModel roomModel = RoomModel(
          id: roomId.toString(),
          createdAt: createdAtTime,
          lastMessage: "",
          lastMessageTime: "",
          members: roomId,
          senderId: "",
          senderName: "",
          senderPhoto: "",
          contactId: "",
          contactName: "",
          contactPhoto: "",
        );
        await firebaseStore
            .collection(AppStrings.chatCollection)
            .doc(roomId.toString())
            .set(roomModel.toMap());
      }
    } else {
      CustomSnackBar.showErrorSnackBar(
          context: context, message: 'No User Found');
    }
  }

  Stream<List<RoomModel>> getRooms() {
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
            );
          },
        ).toList();
      },
    );
  }

  Future sendMessage(
      {required String msg,
      required String receiverId,
      required String roomId}) async {
    MessageModel messageModel = MessageModel(
      createdAt: createdAtTime,
      id: createdAtTime,
      message: msg,
      receiverId: receiverId,
      senderId: userId,
      tybe: "",
      isRead: "",
      receiverName: "",
      senderName: "",
    );

    await firebaseStore
        .collection(AppStrings.chatCollection)
        .doc(roomId)
        .collection(AppStrings.messagesCollection)
        .doc()
        .set(messageModel.toMap());
  }
}
