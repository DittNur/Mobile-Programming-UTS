import 'package:flutter/material.dart';

class Pertemuan2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Pertemuan 2: Layouting',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Widget Column & Row',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              
              Text("Contoh Column (Vertikal):", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.stretch, 
                  children: [
                    _buildKotak(Colors.red, 'Item 1'),
                    SizedBox(height: 10), 
                    _buildKotak(Colors.green, 'Item 2'),
                    SizedBox(height: 10),
                    _buildKotak(Colors.orange, 'Item 3'),
                  ],
                ),
              ),

              SizedBox(height: 40),


              Text("Contoh Row (Horizontal):", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    _buildKotak(Colors.purple, 'A', width: 60),
                    _buildKotak(Colors.teal, 'B', width: 60),
                    _buildKotak(Colors.indigo, 'C', width: 60),
                    _buildKotak(Colors.pink, 'D', width: 60),
                  ],
                ),
              ),
              
              SizedBox(height: 40),


              Text("Contoh Gabungan (Row di dalam Column):", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 10),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, size: 50, color: Colors.blueAccent),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Aditya Nurrohmat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          Text("Flutter Developer", style: TextStyle(color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildKotak(Color warna, String teks, {double? width}) {
    return Container(
      height: 60,
      width: width, 
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        teks,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}