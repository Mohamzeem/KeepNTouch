import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String? senderId;
  final String? senderName;
  final String? receiverId;
  final String? receiverName;
  final String? message;
  final String? createdAt;
  final String? isRead;
  final String? tybe;
  final String? id;
  const MessageModel({
    this.senderId,
    this.senderName,
    this.receiverId,
    this.receiverName,
    this.message,
    this.createdAt,
    this.id,
    this.tybe,
    this.isRead,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'message': message,
      'createdAt': createdAt,
      'id': id,
      'isRead': isRead,
      'tybe': tybe,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'] ?? "",
      senderName: map['senderName'] ?? "",
      receiverId: map['receiverId'] ?? "",
      receiverName: map['receiverName'] ?? "",
      message: map['message'] ?? "",
      createdAt: map['createdAt'] ?? "",
      id: map['id'] ?? "",
      isRead: map['isRead'] ?? "",
      tybe: map['tybe'] ?? "",
    );
  }
  @override
  List<Object> get props {
    return [
      senderId!,
      senderName!,
      receiverId!,
      receiverName!,
      message!,
      createdAt!,
      id!,
      isRead!,
      tybe!
    ];
  }
}
