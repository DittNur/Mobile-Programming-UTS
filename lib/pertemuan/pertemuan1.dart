import 'package:flutter/material.dart';

class Pertemuan1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Pertemuan 1',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      
      // Dibungkus SingleChildScrollView agar teks panjang bisa di-scroll
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pengenalan Android Studio & Flutter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 25),
              
              // --- Pengertian Flutter ---
              Text(
                '1. Apa itu Flutter?',
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Flutter adalah framework (UI toolkit) open-source buatan Google yang digunakan untuk membuat aplikasi antarmuka yang indah dan dikompilasi secara native. Dengan Flutter, Anda dapat membuat aplikasi untuk Android, iOS, web, dan desktop hanya dengan menggunakan satu basis kode program (single codebase). Flutter menggunakan bahasa pemrograman yang disebut Dart.',
                style: TextStyle(
                  fontSize: 16, 
                  color: Colors.black87,
                  height: 1.5, // Memberikan jarak antar baris teks agar mudah dibaca
                ),
                textAlign: TextAlign.justify,
              ),

              SizedBox(height: 25),

              // --- Pengertian Android Studio ---
              Text(
                '2. Apa itu Android Studio?',
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Android Studio adalah Integrated Development Environment (IDE) resmi yang digunakan untuk pengembangan aplikasi Android. Dalam belajar Flutter, Android Studio sangat berguna karena menyediakan editor kode yang canggih, fitur debugging, serta Android Virtual Device (AVD) yang memungkinkan kita menjalankan emulator HP di dalam laptop untuk menguji aplikasi secara langsung.',
                style: TextStyle(
                  fontSize: 16, 
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}