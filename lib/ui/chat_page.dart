import 'package:flutter/material.dart';
import 'package:login_app/models/chatUsersModel.dart';
import 'package:login_app/widgets/conversation_list.dart';

// Ini adalah class ChatPage yang merupakan StatefulWidget.
// Class ini digunakan untuk menampilkan halaman chat.
class ChatPage extends StatefulWidget {
  // Constructor untuk class ChatPage.
  // super.key mengacu pada parameter key yang diterima oleh superclass StatefulWidget.
  const ChatPage({super.key});

  // Method createState() harus di-override untuk membuat instance dari _ChatPageState.
  // Method ini mengembalikan objek dari class _ChatPageState.
  @override
  State<ChatPage> createState() => _ChatPageState();
}


// Ini adalah class _ChatPageState yang merupakan State dari ChatPage.
// Class ini digunakan untuk menampilkan tampilan chat pada halaman pengaduan.
class _ChatPageState extends State<ChatPage> {
  // List chatUsers berisi data pengguna yang terlibat dalam obrolan.
  List<ChatUsers> chatUsers = [    ChatUsers(        name: "Admin ",        messageText: "Apabila sudah selesai dibersihkan, foto akan kami upload",        Image: "assets/admin2.png",        time: "Now"),  ];

  // Method build() harus di-override untuk membuat tampilan halaman pengaduan.
  // Method ini mengembalikan objek Scaffold dengan tampilan pengaduan yang dibangun.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Widget IconButton untuk kembali ke halaman sebelumnya.
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            // Widget SafeArea untuk menempatkan elemen dengan aman di dalam area yang aman dari layar.
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    // Widget Text untuk menampilkan judul layanan pengaduan.
                    Text(
                      "Layanan Pengaduan",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // Widget Padding dan TextField untuk menampilkan kotak pencarian.
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  Image: chatUsers[index].Image,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}