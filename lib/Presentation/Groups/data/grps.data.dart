import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Models/grp_room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';

class GroupsData {
  GroupsData._();

  static final firebaseStore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static final FirebaseStorage storage = FirebaseStorage.instance;

  static Future createGroup({
    required String grpName,
    required List<String> grpMembers,
    required BuildContext context,
  }) async {
    // final String userId = auth.currentUser!.uid;
    final List<String> roomId = grpMembers..sort((a, b) => a.compareTo(b));

    final checkRoom = await firebaseStore
        .collection(AppStrings.groupsCollection)
        .where('members', isEqualTo: roomId)
        .get();
    if (checkRoom.docs.isEmpty) {
      final String createdAtTime =
          DateTime.now().millisecondsSinceEpoch.toString();
      GroupsRoomModel groupsRoomModel = GroupsRoomModel(
        id: roomId.toString(),
        createdAt: createdAtTime,
        lastMessage: "",
        lastMessageTime: "",
        lastMessageSender: "",
        members: roomId,
        senderId: auth.currentUser!.uid,
        senderName: auth.currentUser!.displayName,
        senderPhoto: auth.currentUser!.photoURL ?? "",
        groupPhoto: "",
      );
      await firebaseStore
          .collection(AppStrings.groupsCollection)
          .doc(roomId.toString())
          .set(groupsRoomModel.toMap())
          .whenComplete(() => CustomLoading.toast('Chat created'));
    } else {
      CustomLoading.toast('No Group Found');
    }
  }
}
