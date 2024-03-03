import 'package:equatable/equatable.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';

class GroupsRoomModel extends Equatable {
  final List? members;
  final String? lastMessageTime;
  final String? lastMessage;
  final String? lastMessageSender;
  final String? createdAt;
  final String? id;
  final String? senderId;
  final String? senderName;
  final String? senderPhoto;
  // final String? contactId;
  // final String? contactName;
  final String? groupPhoto;

  const GroupsRoomModel({
    this.members,
    this.lastMessageTime,
    this.lastMessage,
    this.lastMessageSender,
    this.createdAt,
    this.id,
    this.senderId,
    this.senderName,
    this.senderPhoto,
    // this.contactId,
    // this.contactName,
    this.groupPhoto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'members': members,
      'lastMessageTime': lastMessageTime,
      'lastMessage': lastMessage,
      'lastMessageSender': lastMessageSender,
      'createdAt': createdAt,
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'senderPhoto': senderPhoto,
      // 'contactId': contactId,
      // 'contactName': contactName,
      'groupPhoto': groupPhoto,
    };
  }

  factory GroupsRoomModel.fromMap(Map<String, dynamic> map) {
    return GroupsRoomModel(
      members: map['members'] ?? [],
      lastMessageTime: map['lastMessageTime'] ?? "",
      lastMessage: map['lastMessage'] ?? "",
      lastMessageSender: map['lastMessageSender'] ?? "",
      createdAt: map['createdAt'] ?? "",
      id: map['id'] ?? "",
      senderId: map['senderId'] ?? "",
      senderName: map['senderName'] ?? "",
      senderPhoto: map['senderPhoto'] ?? "",
      // contactId: map['contactId'] ?? "",
      // contactName: map['contactName'] ?? "",
      groupPhoto: map['groupPhoto'] ?? "",
    );
  }
  @override
  List<Object> get props {
    return [
      members!,
      lastMessageTime!,
      lastMessage!,
      lastMessageSender!,
      createdAt!,
      id!,
      senderId!,
      senderName!,
      senderPhoto!,
      // contactId!,
      // contactName!,
      groupPhoto!,
    ];
  }

  String get isSenderPhoto {
    if (senderPhoto!.isEmpty || senderPhoto == "") {
      return AppStrings.defaultAppPhoto;
    }
    return senderPhoto!;
  }

  String get isGroupPhoto {
    if (groupPhoto!.isEmpty || groupPhoto == "") {
      return AppStrings.defaultAppPhoto;
    }
    return groupPhoto!;
  }
}
