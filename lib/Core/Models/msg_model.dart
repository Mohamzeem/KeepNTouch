import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String? senderId;
  final String? senderName;
  final String? contactId;
  final String? contactName;
  final String? message;
  final String? createdAt;
  final bool? isRead;
  final bool? isText;
  final String? id;
  const MessageModel({
    this.senderId,
    this.senderName,
    this.contactId,
    this.contactName,
    this.message,
    this.createdAt,
    this.id,
    this.isText,
    this.isRead,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderName': senderName,
      'contactId': contactId,
      'contactName': contactName,
      'message': message,
      'createdAt': createdAt,
      'id': id,
      'isRead': isRead,
      'isText': isText,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'] ?? "",
      senderName: map['senderName'] ?? "",
      contactId: map['contactId'] ?? "",
      contactName: map['contactName'] ?? "",
      message: map['message'] ?? "",
      createdAt: map['createdAt'] ?? "",
      id: map['id'] ?? "",
      isRead: map['isRead'],
      isText: map['isText'],
    );
  }
  @override
  List<Object> get props {
    return [
      senderId!,
      senderName!,
      contactId!,
      contactName!,
      message!,
      createdAt!,
      id!,
      isRead!,
      isText!
    ];
  }
}
