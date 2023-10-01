// Import library yang dibutuhkan
import 'package:flutter/material.dart';

// Function utama aplikasi
void main() {
  // Menjalankan aplikasi dengan material design menggunakan class MaterialApp
  runApp(const MaterialApp(
    title: "Jadwal Pembersihan", // Judul aplikasi
  ));
}

// Widget stateful untuk menampilkan jadwal
class Jadwal extends StatefulWidget {
  @override
  State<Jadwal> createState() => _JadwalState();
}

// State untuk widget Jadwal
class _JadwalState extends State<Jadwal> {
  // Inisialisasi data jadwal
  List<String> dummy = [    "Senin",    "Selasa",    "Rabu",    "Kamis",    "Jumat",  ];
  List<String> contoh = [    "12.00 WIB",    "13.30 WIB",    "12.45 WIB",    "11.30 WIB",    "09.10 WIB",  ];

  // Method build untuk menampilkan widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Membuat app bar dengan judul "Jadwal dibersihkan"
        appBar: AppBar(
          title: const Text("Jadwal dibersihkan"),
          backgroundColor: Color.fromARGB(255, 106, 98, 255), // Background color app bar
        ),
        backgroundColor: Colors.white, // Background color body
        body: SafeArea(
            child: Container(
          child: Column(children: <Widget>[
            const SizedBox(height: 30), // Menggunakan SizedBox untuk memberikan jarak antar widget
            SizedBox(
              height: 150, // Menentukan ukuran gambar
              width: double.infinity,
              child: Image.asset("assets/jadwal.jpg"), // Menampilkan gambar dari asset
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // Menentukan tinggi ListView agar dapat scroll
              child: ListView.builder(
                itemCount: dummy.length, // Jumlah item pada ListView
                itemBuilder: (context, position) {
                  // Membuat widget untuk menampilkan jadwal pada setiap harinya
                  return Container(
                    padding: const EdgeInsets.all(5), // Padding untuk widget
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            width: 50,
                            child: Text(
                              dummy[position], // Menampilkan nama hari
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold), // Menentukan style text
                            )),
                        const SizedBox(width: 10),
                        Container(
                          width: 150, // Menentukan lebar box
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)), // Menggunakan border radius pada box
                            color: Color.fromARGB(255, 106, 98, 255), // Background color box
                          ),
                          child: Text(contoh[position], // Menampilkan waktu pembersihan pada hari tersebut
                              style: const TextStyle(
                                  color: Colors.white, // Menentukan warna text
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)), // Menentukan style text
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
        )));
  }
}
