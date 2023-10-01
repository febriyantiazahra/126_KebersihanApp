import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/controller/user_controller.dart';
import 'package:login_app/ui/chat_page.dart';
import 'package:login_app/ui/hasil_dibersihkan.dart';
import 'package:login_app/ui/jadwal_bersih.dart';

///membuat tampilan halaman homepage
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

///user controller untuk UserController dapat mengatur beberapa hal seperti pengambilan data pengguna dari database, 
///melakukan validasi data pengguna, serta mengubah data pengguna yang telah disimpan dalam aplikasi
class _HomepageState extends State<Homepage> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    ///memberikan pesan sambutan kepada pengguna atau user yang membuka halaman utama pada aplikasi.
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 106, 98, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hai, Selamat Datang!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ///memberi opsi untuk keluar akun pengguna
                  IconButton(
                    icon: new Icon(Icons.logout),
                    highlightColor: Colors.black,
                    onPressed: () {
                      userController.logout();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ///semacam bar kolom tempat fitur-fitur dari aplikasi
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    ///fitur search untuk mencari
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              ///mengkelompokkan fitur-fitur yang ada di aplikasi
              const SizedBox(
                height: 2,
              ),
              const Text(
                "Category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),

              // Widget Container digunakan untuk mengelompokkan beberapa widget
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),

                // Widget Column digunakan untuk menampilkan beberapa widget children secara berurutan
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // Widget Card digunakan untuk menampilkan sebuah kotak dengan efek bayangan pada sudutnya
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 120),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),

                      // Widget InkWell digunakan untuk menambahkan aksi (action) ketika widget ditekan
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ChatPage());
                        },
                        splashColor: Color.fromARGB(255, 137, 164, 255),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              // Widget Image.asset digunakan untuk menampilkan gambar pada halaman utama
                              Image.asset("assets/pesan.jpg",
                                  height: 100, width: 130, fit: BoxFit.contain),
                              const Text(
                                "laporkan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    height: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Widget SizedBox digunakan untuk memberi jarak antara widget lainnya
                    SizedBox(height: 10),

                    // Widget Card digunakan untuk menampilkan sebuah kotak dengan efek bayangan pada sudutnya
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 120),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),

                      // Widget InkWell digunakan untuk menambahkan aksi (action) ketika widget ditekan
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const Hasil());
                        },
                      splashColor: Color.fromARGB(255, 137, 164, 255),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset("assets/kertas.jpg",
                                height: 100, width: 150, fit: BoxFit.contain),
                            const Text(
                              "lampiran",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  height: 1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 120),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => Jadwal());
                      },
                      splashColor: Color.fromARGB(255, 137, 164, 255),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset("assets/jadwal.jpg",
                                height: 100, width: 190, fit: BoxFit.contain),
                            const Text(
                              "Jadwal ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  height: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}