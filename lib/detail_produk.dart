import 'package:flutter/material.dart';

class DetailProdukPage extends StatelessWidget {

  final String kode;
  final String nama;
  final String harga;

  DetailProdukPage({
    required this.kode, 
    required this.nama, 
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Detail Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, 
            children: [
              Text(
                "Informasi Produk",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              Divider(thickness: 1),
              SizedBox(height: 10),
              
              _buildInfoRow("Kode", kode),
              _buildInfoRow("Nama", nama),
              _buildInfoRow("Harga", "Rp $harga"),
              
              SizedBox(height: 20),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  child: Text("KEMBALI", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}