import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Models/grp_room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';
import 'package:keep_n_touch/Presentation/Groups/controller/grps_states.dart';

class GroupsController extends GetxController {
  final states = GroupsStates();
  final grpController = TextEditingController();
  final changeGrpController = TextEditingController();
  final chatController = TextEditingController();
  final scrollController = ScrollController();
  final firebaseStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void dispose() {
    chatController.dispose();
    chatController.clear();
    changeGrpController.dispose();
    changeGrpController.clear();
    grpController.dispose();
    grpController.clear();
    scrollController.dispose();
    super.dispose();
  }

  String get groupName => grpController.text;
  set groupName(String value) {
    grpController.text = value;
    update();
  }

  bool get isChecked => states.isChecked;
  set isChecked(bool value) {
    states.isChecked = value;
    update();
  }

  Future createGroupRoom({
    required List<String> grpMembers,
    required BuildContext context,
  }) async {
    CustomLoading.show();
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
        groupName: groupName,
        createdAt: createdAtTime,
        lastMessage: "",
        lastMessageTime: "",
        lastMessageSender: DateTime.now().toString(),
        members: roomId,
        senderId: _auth.currentUser!.uid,
        senderName: _auth.currentUser!.displayName,
        senderPhoto: _auth.currentUser!.photoURL ?? "",
        groupPhoto: "",
      );
      await firebaseStore
          .collection(AppStrings.groupsCollection)
          .doc(roomId.toString())
          .set(groupsRoomModel.toMap())
          .whenComplete(
        () {
          grpController.clear();
          Get.back();
          CustomLoading.toast(text: 'Group Created');
        },
      );
    } else {
      Get.back();
      CustomLoading.toast(text: 'Group Exists');
    }
  }

  Stream<List<GroupsRoomModel>> getGroupRooms() {
    return firebaseStore
        .collection(AppStrings.groupsCollection)
        .where('members', arrayContains: _auth.currentUser!.uid)
        .snapshots()
        .map(
      (value) {
        return value.docs.map(
          (e) {
            final data = e.data();
            return GroupsRoomModel(
              id: data['id'],
              groupName: data['groupName'],
              createdAt: data['createdAt'],
              lastMessage: data['lastMessage'],
              lastMessageTime: data['lastMessageTime'],
              lastMessageSender: data['lastMessageSender'],
              members: data['members'],
              senderId: data['senderId'],
              senderName: data['senderName'],
              senderPhoto: data['senderPhoto'],
              groupPhoto: data['groupPhoto'],
            );
          },
        ).toList();
      },
    );
  }

  void goAddGrpMemebers() {
    if (grpController.text.isEmpty) {
      CustomLoading.toast(
          text: 'Please enter a group name',
          toastPosition: EasyLoadingToastPosition.center);
    } else if (grpController.text.length < 5) {
      CustomLoading.toast(
          text: 'Name must be 5 characters at least',
          toastPosition: EasyLoadingToastPosition.center);
    } else {
      Get.back();
      Get.toNamed(AppRoute.createGroupsView);
    }
  }
}
