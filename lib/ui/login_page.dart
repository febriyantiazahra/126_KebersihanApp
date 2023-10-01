// Import packages dan file yang dibutuhkan
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/controller/user_controller.dart';
import 'package:login_app/ui/register_page.dart';

// Class LoginPage yang merupakan StatelessWidget
class LoginPage extends StatelessWidget {
  // Constructor LoginPage
  LoginPage({Key? key}) : super(key: key);

  // GlobalKey untuk Form
  final _formKey = GlobalKey<FormState>();

  // Deklarasi variabel email dan password
  String _email = '';
  String _password = '';

  // Deklarasi objek UserController dengan dependency injection dari GetX
  UserController userController = Get.put(UserController());

  // Method build untuk mengatur tampilan UI dari LoginPage
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar perangkat
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Tampilan gambar di bagian atas halaman
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                // Tampilan judul halaman
                const Text(
                  'Kebersihan Kota',
                  style: TextStyle(
                      color: Color.fromARGB(255, 107, 100, 245),
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
                // Form field untuk email
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'eMail',
                      hintText: 'Masukkan eMail anda',
                      fillColor: Color.fromARGB(255, 107, 100, 245),
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (newValue) {
                      if (newValue != null) {
                        _email = newValue;
                      }
                    },
                  ),
                ),
                // Form field untuk password
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Masukkan password anda',
                    ),
                    onSaved: (newValue) {
                      if (newValue != null) {
                        _password = newValue;
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
                // Tombol untuk melakukan login
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 107, 100, 245),
                          foregroundColor: Colors.white),
                      onPressed: () {
                        // Mengambil nilai dari form field dan melakukan login
                        _formKey.currentState?.save();
                        userController.login(_email, _password);
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Link untuk pindah ke halaman pendaftaran
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Belum Punya Akun?'),
                    TextButton(
                        child: const Text(
                          'DAFTAR SEKARANG',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 107, 100, 245),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => RegisterPage());
                        }),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
