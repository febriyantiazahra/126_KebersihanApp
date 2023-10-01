///Mengimpor library material dan cupertino dari Flutter.
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///Mendefinisikan class ChatUsers dengan memiliki properti name,
///messageText, time, dan Image, masing-masing dari tipe String.
///Class ini juga memiliki constructor dengan named parameter yang
/// mengambil semua properti yang didefinisikan sebelumnya.
class ChatUsers {
  String name;
  String messageText;
  String time;
  String Image;
  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.Image,
      required this.time});
}

///Mendefinisikan class ChatMessage dengan memiliki properti messageContent
///dan messageType, masing-masing dari tipe String. Class ini juga memiliki
///constructor dengan named parameter yang mengambil semua properti yang didefinisikan sebelumnya.
class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({
    required this.messageContent,
    required this.messageType,
  });
}
