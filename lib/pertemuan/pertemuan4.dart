import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uts2/page/show_summary.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

class GlobalData {
  static String summary = "";
  static String experience = "";
}

class Pertemuan4Page extends StatefulWidget {
  const Pertemuan4Page({super.key});

  @override
  State<Pertemuan4Page> createState() => _Pertemuan4PageState();
}

class _Pertemuan4PageState extends State<Pertemuan4Page> {
  int currentPage = 0;

  final TextEditingController _summaryController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  @override
  void dispose() {
    _summaryController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      _buildContent(context), 
      const Center(child: Text("Profile Page Placeholder")) 
    ]; 
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Pertemuan 4: Allert Toast",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: pages[currentPage], 
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              const Icon(Icons.account_box, size: 80, color: Colors.blueAccent),
              const SizedBox(height: 20),
              TextField(
                controller: _summaryController,
                maxLines: 3, 
                decoration: InputDecoration(
                  labelText: "Profil / Summary",
                  hintText: "Contoh: IT Infrastructure Engineer yang fokus pada pengelolaan Windows Server...",
                  prefixIcon: const Icon(Icons.description, color: Colors.blueAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _experienceController,
                maxLines: 3, 
                decoration: InputDecoration(
                  labelText: "Pengalaman Kerja",
                  hintText: "Contoh: Membangun infrastruktur jaringan untuk PT. MattzStore...",
                  prefixIcon: const Icon(Icons.work_history, color: Colors.blueAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Submit
              _buildActionButton(
                label: "Submit Data",
                icon: Icons.save,
                color: Colors.green,
                onTap: () {
                  // Validasi sederhana menggunakan if-else
                  if (_summaryController.text.isEmpty || _experienceController.text.isEmpty) {
                    CherryToast.warning(
                      title: const Text("Peringatan"),
                      description: const Text("Data profil dan pengalaman tidak boleh kosong!"),
                      borderRadius: 10,
                    ).show(context);
                  } else {
                    SimpleAlertDialog.show(
                      context,
                      assetImagepath: AnimatedImage.confirm,
                      buttonsColor: Colors.green,
                      title: AlertTitleText("Apakah Kamu Yakin?"), 
                      content: AlertContentText("Apakah Kamu Ingin Menambahkan Data Profil Ini?"),
                      onConfirmButtonPressed: (ctx) {
                        GlobalData.summary = _summaryController.text;
                        GlobalData.experience = _experienceController.text;

                        Navigator.pop(ctx);

                        CherryToast.success(
                          title: const Text("Berhasil Menambah Data!"),
                          borderRadius: 10,
                        ).show(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowSummaryPage(
                              summary: GlobalData.summary,
                              experience: GlobalData.experience,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              
              const SizedBox(height: 15),

              // Tombol Delete
              _buildActionButton(
                label: "Hapus Data",
                icon: Icons.delete_forever,
                color: Colors.red,
                onTap: () {
                  if (_summaryController.text.isEmpty && _experienceController.text.isEmpty) {
                     CherryToast.info(
                      title: const Text("Info"),
                      description: const Text("Form sudah dalam keadaan kosong."),
                      borderRadius: 10,
                    ).show(context);
                  } else {
                    SimpleAlertDialog.show(
                      context,
                      assetImagepath: AnimatedImage.warning,
                      buttonsColor: Colors.red, 
                      title: AlertTitleText("Konfirmasi Hapus"), 
                      content: AlertContentText("Apakah Kamu Ingin Menghapus Semua Ketikan?"),
                      onConfirmButtonPressed: (ctx) {
                        Navigator.pop(ctx);
                        
                        setState(() {
                          _summaryController.clear();
                          _experienceController.clear();
                          GlobalData.summary = "";
                          GlobalData.experience = "";
                        });

                        CherryToast.success(
                          title: const Text("Berhasil Menghapus Data!"),
                          borderRadius: 10,
                        ).show(context);
                      },
                    );
                  }
                },
              ),

              const SizedBox(height: 15),

              // Tombol Show Dialog
              _buildActionButton(
                label: "Info (Standar Dialog)",
                icon: Icons.info_outline,
                color: Colors.grey[700]!,
                onTap: () {
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      title: const Row(
                        children: [
                          Icon(Icons.info, color: Colors.blueAccent),
                          SizedBox(width: 10),
                          Text("Informasi"),
                        ],
                      ),
                      content: const Text("Ini adalah contoh AlertDialog standar bawaan Flutter, bentuknya lebih simpel dibandingkan package simple_alert_dialog."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context), 
                          child: const Text("Tutup", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20), 
            ], 
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({required String label, required IconData icon, required Color color, required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15), 
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 6,
                offset: const Offset(0, 3),
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                label, 
                style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)
              ),
            ],
          ),
        ),
      ),
    );
  }
}