// ignore_for_file: avoid_print, duplicate_ignore

import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/firedart.dart';
import 'package:get/get.dart';
import 'package:login_app/ui/home_page.dart';
import 'package:login_app/ui/login_page.dart';

// Membuat class UserController
class UserController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

// Membuat method untuk Login
  void login(String email, String password) async {
    try {
      // Menjalankan Firebase
      await FirebaseAuth.instance.signIn(email, password);
      // ignore: unused_local_variable
      // Membuat variabel user
      var user = await FirebaseAuth.instance.getUser();
      Get.offAll(() => const Homepage());
    } catch (e) {
      // Menampilkan pesan keterangan setelah login
      if (e.toString() == 'AuthException: INVALID_EMAIL') {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Login Error',
            message: 'Format email salah',
            duration: Duration(seconds: 3),
          ),
        );
        // Menampilkan pesan keterangan setelah login
      } else if (e.toString() == 'AuthException: INVALID_PASSWORD') {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Login Error',
            message: 'Password salah',
            duration: Duration(seconds: 3),
          ),
        );
        // Menampilkan pesan keterangan setelah login
      } else if (e.toString() == 'AuthException: EMAIL_NOT_FOUND') {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Login Error',
            message: 'User tidak terdaftar',
            duration: Duration(seconds: 3),
          ),
        );
      }
      // ignore: avoid_print
      print(e.toString());
    }
  }

// Method untuk melakukan logout
  void logout() {
    FirebaseAuth.instance.signOut();

    Get.offAll(() => LoginPage());
  }

//Method untuk melakukan pendaftaran
  void daftar(String email, String password, String nama, String alamat) async {
    try {
      var result = await FirebaseAuth.instance.signUp(email, password);
      Get.offAll(() => LoginPage());

      tambahUser(nama, email, alamat, password);
      // Menampilkan pesan keterangan setelah berhasil mendaftar
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menambahkan data",
          textConfirm: "Oke",
          onConfirm: (() => Get.back()));
    } catch (e) {
      print(e);
      // Menampilkan pesan keterangan jika terjadi kesalahan ketika mendaftar
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak berhasil menambahkan data",
      );
    }
  }

// Method untuk melakukan tambah user
  void tambahUser(
      String nama, String email, String alamat, String password) async {
    await Firestore.instance.collection('masyarakat').add(
        {'name': nama, 'alamat': alamat, 'email': email, 'password': password});
  }
}
