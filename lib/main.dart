import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_app/data/hive_store.dart';
import 'package:login_app/data/token_adapter.dart';
import 'package:login_app/ui/login_page.dart';
import 'package:login_app/ui/splash_screen.dart';

///Menambahkan firebase untuk memasukkan akun///
const apiKey = "AIzaSyDNExE1QxkeM_AMvABVGuz69IwFO-zH1v4";
const projectId = "kebersihan-53a70";

//method untuk menyimpan data login//
void main() async {
  Firestore.initialize('kebersihan-53a70');

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TokenAdapter());

  FirebaseAuth.initialize(apiKey, await HiveStore.create());

  runApp(const MyApp());
}

//Membuat class//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // untuk menampilkan halaman selanjutnya yang dibuka//
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kebersihan Kota',
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContextcontext) => LoginPage()
        });
  }
}
