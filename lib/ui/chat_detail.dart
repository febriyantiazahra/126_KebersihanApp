import 'package:flutter/material.dart';
import 'package:login_app/models/chatUsersModel.dart';

// Membuat class ChatDetailPage
class ChatDetailPage extends StatefulWidget {
  @override

  _ChatDetailPageState createState() => _ChatDetailPageState();
}

// Membuat class ChatDetailPageState
class _ChatDetailPageState extends State<ChatDetailPage> {
  // Membuat list daftar pesan yang akan ditampilkan
  List<ChatMessage> messages = [
    ChatMessage(
      messageContent: "Selamat Datang di aplikasi Kebersihan Kota",
      messageType: "receiver",
    ),
    // Membuat pesan yang akan ditampilkan
    ChatMessage(
      messageContent: "Silahkan sampaikan pengaduan anda",
      messageType: "receiver",
    ),
    // Membuat pesan yang akan ditampilkan
    ChatMessage(
      messageContent: "Di daerah kasihan bantul ada penumpukan sampah",
      messageType: "sender",
    ),
    // Membuat pesan yang akan ditampilkan
    ChatMessage(
      messageContent: "tolong segera dibersihkan ya",
      messageType: "sender",
    ),
    // Membuat pesan yang akan ditampilkan
    ChatMessage(
      messageContent: "Baik, laporan akan segera kami proses",
      messageType: "receiver",
    ),
    // Membuat pesan yang akan ditampilkan
    ChatMessage(
      messageContent:
          "Apabila sudah selesai dibersihkan, foto akan kami upload",
      messageType: "receiver",
    ),
  ];
  @override
  // Menambahkan widget untuk tampilan aplikasi
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType == "receiver"
                            ? Colors.grey.shade200
                            : const Color.fromARGB(255, 87, 50, 235)),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 106, 98, 255),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      elevation: 0,
                      child: const Icon(
                        Icons.send,
                        color: Color.fromARGB(255, 106, 98, 255),
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://pngimage.net/wp-content/uploads/2018/05/admin-logo-png-6.png"),
                    maxRadius: 20,
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Admin",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.call,
                    color: Color.fromARGB(255, 106, 98, 255),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}