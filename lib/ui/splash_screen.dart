import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_app/ui/login_page.dart';

///membuat class
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

///mengarahkan halaman splashscreen pindah ke login page
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
    });
  }

///mengatur background dan menambahkan gambar pada halaman splash screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 3,
            ),
            Container(
              color: Colors.white,
              width: 100,
              child: Image.asset(
                "assets/logo.png",
                height: 180,
                fit: BoxFit.fitWidth,
              ),
            ),
          ]),
        ));
  }
}
