import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/controller/user_controller.dart';
import 'package:login_app/ui/login_page.dart';

///membuat class halaman register 
class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

///mendefinisikan variabel objek register untuk mengisi email, password, alamat, nama
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String alamat = '';
  String nama = '';

///Mendapatkan referensi ke koleksi "masyarakat" di Firestore dan menyimpannya di variabel masyarakat.
  UserController userController = Get.put(UserController());
  CollectionReference masyarakat = Firestore.instance.collection('masyarakat');

  @override
  Widget build(BuildContext context) {
    ///Membuat tampilan untuk halaman register
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 400,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/background.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        ///membuat tempat untuk menginputkan nama user
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'nama',
                                  hintText: 'Masukkan nama',
                                  fillColor: Color.fromARGB(255, 107, 100, 245),
                                  border: OutlineInputBorder(),
                                ),
                                onSaved: (newValue) {
                                  if (newValue != null) {
                                    nama = newValue;
                                  }
                                })),
                        ///kolom untuk memasukkan alamat user
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'alamat',
                                  hintText: 'Masukkan alamat',
                                  fillColor: Color.fromARGB(255, 107, 100, 245),
                                  border: OutlineInputBorder(),
                                ),
                                onSaved: (newValue) {
                                  if (newValue != null) {
                                    alamat = newValue;
                                  }
                                })),
                        ///kolom untuk memasukkan alamat user
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'eMail',
                                  hintText: 'Masukkan eMail',
                                  fillColor: Color.fromARGB(255, 107, 100, 245),
                                  border: OutlineInputBorder(),
                                ),
                                onSaved: (newValue) {
                                  if (newValue != null) {
                                    email = newValue;
                                  }
                                })),
                        ///kolom untuk memasukkan password user
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Masukkan password',
                              fillColor: Color.fromARGB(255, 107, 100, 245),
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (newValue) {
                              if (newValue != null) {
                                password = newValue;
                              }
                            },
                          ),
                        ),
                        ///memungkinkan pengguna untuk mendaftar dengan memasukkan informasi mereka pada Form widget dan menekan tombol Register.
                        SizedBox(height: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 107, 100, 245),
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  _formKey.currentState!.save();
                                  if ((email != '') && (password != '')) {
                                    userController.daftar(
                                        email, password, alamat, nama);
                                  }
                                },
                                child: const Text("Register")),
                          ],
                        ),
                        ///opsi untuk user yang sudah memiliki akun
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Sudah Punya Akun?'),
                            TextButton(
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 107, 100, 245),
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(() => LoginPage());
                                })
                          ],
                        )
                      ])),
            )));
  }
}
