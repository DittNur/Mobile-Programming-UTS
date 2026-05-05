import 'package:flutter/material.dart';

class Pertemuan3Page extends StatefulWidget {
  @override
  _Pertemuan3PageState createState() => _Pertemuan3PageState();
}

class _Pertemuan3PageState extends State<Pertemuan3Page> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  @override
  void dispose() {
    _kodeController.dispose();
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  void _submitData() {
    // Mengecek apakah semua input sudah valid
    if (_formKey.currentState!.validate()) {
      // Jika valid, navigasi ke halaman detail sambil mengirim data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailProdukPage(
            kode: _kodeController.text,
            nama: _namaController.text,
            harga: _hargaController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Pertemuan 3: Form & Navigasi',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pengisian Form Produk',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Silakan isi detail produk di bawah ini.',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 25),
              

              TextFormField(
                controller: _kodeController,
                decoration: InputDecoration(
                  labelText: "Kode Produk",
                  prefixIcon: Icon(Icons.qr_code), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kode produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: "Nama Produk",
                  prefixIcon: Icon(Icons.shopping_bag),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Harga Produk",
                  prefixText: "Rp ",
                  prefixIcon: Icon(Icons.monetization_on),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    "SIMPAN & LIHAT DETAIL",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DetailProdukPage extends StatelessWidget {
  final String kode;
  final String nama;
  final String harga;

  DetailProdukPage({required this.kode, required this.nama, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Produk", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card( 
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Text(
                      "Informasi Produk", 
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(height: 30, thickness: 1),
                
                _buildDetailRow("Kode", kode),
                SizedBox(height: 15),
                _buildDetailRow("Nama", nama),
                SizedBox(height: 15),
                _buildDetailRow("Harga", "Rp $harga"),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}