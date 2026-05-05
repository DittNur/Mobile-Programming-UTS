import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_uts2/pertemuan/pertemuan4.dart';

class CheckboxPage extends StatefulWidget {
  @override
  _FormCheckboxExampleState createState() => _FormCheckboxExampleState();
}

class _FormCheckboxExampleState extends State<CheckboxPage> {
  // Form controllers
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();
  
  // Checkbox states
  bool _isCheckedSyarat = false;
  bool _selectAllHobbies = false; // Tambahan state untuk "Pilih Semua"
  String _errorText = '';
  
  // Hobby checkboxes
  Map<String, bool> _hobbies = {
    'Membaca': false,
    'Olahraga': false,
    'Musik': false,
    'Game': false,
    'Traveling': false,
  };
  
  // Form validation errors
  String _namaError = '';
  String _nimError = '';
  String _kelasError = '';
  String _hobbyError = '';

  // Fungsi untuk fitur "Pilih Semua"
  void _toggleSelectAll(bool? value) {
    setState(() {
      _selectAllHobbies = value ?? false;
      // Mengubah semua nilai hobi mengikuti status "Pilih Semua"
      _hobbies.updateAll((key, val) => _selectAllHobbies);
      
      if (_selectAllHobbies) {
        _hobbyError = '';
      }
    });
  }

  // Cek apakah semua hobi tercentang manual untuk update status "Pilih Semua"
  void _checkIfAllSelected() {
    bool allSelected = true;
    _hobbies.forEach((key, value) {
      if (!value) {
        allSelected = false;
      }
    });
    setState(() {
      _selectAllHobbies = allSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          // Menggunakan Gradient agar terlihat lebih modern
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightGreenAccent.shade400, Colors.green.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
          ),
          title: Text(
            'Form Registrasi (Checkbox)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          elevation: 4,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Form Section
                Card(
                  elevation: 6,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section Title
                        _buildSectionHeader('Data Mahasiswa', Colors.blue),
                        SizedBox(height: 20),
                        
                        // Field Nama
                        _buildCustomTextField(
                          controller: _namaController,
                          label: 'Nama Lengkap',
                          hint: 'Masukkan nama lengkap',
                          icon: Icons.person_outline,
                          errorMsg: _namaError,
                        ),
                        SizedBox(height: 16),
                        
                        // Field NIM
                        _buildCustomTextField(
                          controller: _nimController,
                          label: 'NIM',
                          hint: 'Masukkan NIM Anda',
                          icon: Icons.numbers,
                          errorMsg: _nimError,
                          isNumber: true,
                        ),
                        SizedBox(height: 16),
                        
                        // Field Kelas
                        _buildCustomTextField(
                          controller: _kelasController,
                          label: 'Kelas',
                          hint: 'Contoh: 01SIFP001',
                          icon: Icons.class_,
                          errorMsg: _kelasError,
                        ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                
                // Hobi Section
                Card(
                  elevation: 6,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader('Minat & Hobi', Colors.orange.shade600, subtext: '(Pilih minimal 1)'),
                        SizedBox(height: 10),
                        
                        // Checkbox "Pilih Semua" (Master)
                        CheckboxListTile(
                          title: Text(
                            "Pilih Semua", 
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange.shade800)
                          ),
                          value: _selectAllHobbies,
                          onChanged: _toggleSelectAll,
                          activeColor: Colors.orange.shade800,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                        ),
                        Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
                        SizedBox(height: 10),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey.shade50,
                          ),
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 3.5, // Disesuaikan agar teks tidak terpotong
                            children: _hobbies.keys.map((hobby) {
                              return CheckboxListTile(
                                title: Text(
                                  hobby,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                                value: _hobbies[hobby],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _hobbies[hobby] = value ?? false;
                                    _checkIfAllSelected(); // Cek apakah perlu centang "Pilih Semua"
                                    
                                    if (_hobbies.values.any((selected) => selected)) {
                                      _hobbyError = '';
                                    }
                                  });
                                },
                                activeColor: Colors.orange.shade600,
                                checkColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                                dense: true,
                                controlAffinity: ListTileControlAffinity.leading,
                              );
                            }).toList(),
                          ),
                        ),
                        
                        if (_hobbyError.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Icon(Icons.warning, size: 16, color: Colors.red),
                                SizedBox(width: 4),
                                Text(_hobbyError, style: TextStyle(color: Colors.red, fontSize: 12)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                
                // Syarat dan Ketentuan
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: Text(
                            'Saya menyetujui syarat dan ketentuan yang berlaku dalam sistem akademik.',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          value: _isCheckedSyarat,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedSyarat = value ?? false;
                              if (_isCheckedSyarat) {
                                _errorText = '';
                              }
                            });
                          },
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                        ),
                        if (_errorText.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(left: 48, bottom: 8), // Sejajar dengan teks atas
                            child: Row(
                              children: [
                                Icon(Icons.error_outline, size: 14, color: Colors.red),
                                SizedBox(width: 4),
                                Text(_errorText, style: TextStyle(color: Colors.red, fontSize: 12)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 24),
                
                // Submit Button
                Container(
                  width: double.infinity,
                  height: 55, // Tinggi tombol dibuat tetap agar kokoh
                  child: ElevatedButton(
                    onPressed: () => _validateAndSubmit(context),
                    child: Text(
                      'DAFTAR SEKARANG',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
  }
  
  // Helper Widget untuk Header Section agar kode lebih bersih
  Widget _buildSectionHeader(String title, Color color, {String? subtext}) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
        ),
        if (subtext != null) ...[
          SizedBox(width: 8),
          Text(subtext, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
        ]
      ],
    );
  }

  // Helper Widget untuk TextField dengan validasi visual bawaan
  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String errorMsg,
    bool isNumber = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade50,
        errorText: errorMsg.isNotEmpty ? errorMsg : null,
        prefixIcon: Icon(icon, color: Colors.blue.shade600),
        labelStyle: TextStyle(color: Colors.grey.shade700),
        // Desain border saat normal
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        // Desain border saat error (garis merah)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.shade400, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.shade600, width: 2),
        ),
      ),
    );
  }

  void _validateAndSubmit(BuildContext context) {
    setState(() {
      // Reset errors
      _namaError = '';
      _nimError = '';
      _kelasError = '';
      _hobbyError = '';
      _errorText = '';
      
      // Validasi dengan if-else
      if (_namaController.text.trim().isEmpty) {
        _namaError = 'Nama tidak boleh kosong';
      }
      
      if (_nimController.text.trim().isEmpty) {
        _nimError = 'NIM tidak boleh kosong';
      } else if (_nimController.text.trim().length < 8) {
        _nimError = 'NIM minimal 8 karakter';
      }
      
      if (_kelasController.text.trim().isEmpty) {
        _kelasError = 'Kelas tidak boleh kosong';
      }
      
      if (!_hobbies.values.any((selected) => selected)) {
        _hobbyError = 'Pilih minimal 1 hobi';
      }
      
      if (!_isCheckedSyarat) {
        _errorText = 'Anda harus menyetujui syarat dan ketentuan';
      }
      
      // Jika semua validasi lulus
      if (_namaError.isEmpty && 
          _nimError.isEmpty && 
          _kelasError.isEmpty && 
          _hobbyError.isEmpty && 
          _isCheckedSyarat) {
        
        List<String> selectedHobbies = _hobbies.keys
            .where((hobby) => _hobbies[hobby] == true)
            .toList();

        GlobalData.nama = _namaController.text;
        GlobalData.nim = _nimController.text;
        GlobalData.kelas = _kelasController.text;
        GlobalData.hobi = selectedHobbies.join(', ');
        
        // Mendapatkan waktu saat ini
        String waktuDaftar = "${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}";
        
        // Tampilkan success dialog
        showDialog(
          context: context,
          barrierDismissible: false, // Tidak bisa ditutup dengan tap di luar
          builder: (context) => Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.green.shade50, shape: BoxShape.circle),
                    child: Icon(Icons.check_circle, size: 64, color: Colors.green.shade600),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Pendaftaran Berhasil!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                  ),
                  SizedBox(height: 5),
                  Text("Tercatat pada jam $waktuDaftar", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow(Icons.person, 'Nama', _namaController.text),
                      SizedBox(height: 12),
                      _buildInfoRow(Icons.numbers, 'NIM', _nimController.text),
                      SizedBox(height: 12),
                      _buildInfoRow(Icons.class_, 'Kelas', _kelasController.text),
                      SizedBox(height: 12),
                      _buildInfoRow(Icons.favorite, 'Hobi', selectedHobbies.join(', ')),
                    ],
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _resetForm();
                      Fluttertoast.showToast(
                        msg: 'Pendaftaran Berhasil Disimpan!!',
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                    },
                    child: Text('TUTUP', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45),
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
  
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.blue.shade600),
        SizedBox(width: 12),
        Expanded( // Mencegah overflow jika teks terlalu panjang
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              SizedBox(height: 2),
              Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }
  
  void _resetForm() {
    setState(() {
      _namaController.clear();
      _nimController.clear();
      _kelasController.clear();
      _selectAllHobbies = false;
      _hobbies.updateAll((key, value) => false);
      _isCheckedSyarat = false;
      _namaError = '';
      _nimError = '';
      _kelasError = '';
      _hobbyError = '';
      _errorText = '';
    });
  }
  
  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }
}