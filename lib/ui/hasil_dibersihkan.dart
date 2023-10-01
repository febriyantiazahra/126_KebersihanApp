import 'package:flutter/material.dart';

class Hasil extends StatefulWidget {
  const Hasil({super.key}); ///Widget yang menampilkan hasil dari operasi bersihkan gambar.

  @override
  State<Hasil> createState() => _HasilState();
}

class _HasilState extends State<Hasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hasil setelah dibersihkan"), ///// Menampilkan judul halaman.
          backgroundColor: Color.fromARGB(255, 106, 98, 255), /// // Mengatur warna latar belakang AppBar.
        ),
        body: GridView.count(crossAxisCount: 2, children: <Widget>[
          ///// Menampilkan gambar dan keterangan untuk setiap gambar.
          Card(
            elevation: 5,
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Image.asset("assets/bersih1.jpg", width: 300),
              const Text(
                "gambar 1",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              )
            ])),
          ),
          Card(
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Image.asset("assets/bersih2.jpg", width: 300),
              const Text(
                "gambar 2",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              )
            ])),
          ),
          Card(
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Image.asset("assets/bersih3.jpg", width: 300),
              const Text(
                "gambar 3",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              )
            ])),
          ),
          Card(
              child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Image.asset("assets/bersih 4.jpg", width: 300),
            const Text(
              "gambar 4",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            )
          ])))
        ]));
  }
}
