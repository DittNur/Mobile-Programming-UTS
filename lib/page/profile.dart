import 'package:flutter/material.dart';
import 'package:flutter_uts2/page/show_summary.dart';
import 'package:flutter_uts2/pertemuan/pertemuan4.dart'; 
import 'package:flutter_uts2/page/dashboard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentPage = 1; 

  @override
  Widget build(BuildContext context) {
    List<Widget> page = [
      DashboardPage(),
      _buildProfileUI(context), 
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), 
      body: page[currentPage], 
    );
  }

  Widget _buildProfileUI(BuildContext context) {
    String displayNama = GlobalData.nama.isNotEmpty ? GlobalData.nama : "Aditya Nurrohmat";
    String displayNim = GlobalData.nim.isNotEmpty ? GlobalData.nim : "241011701296";
    String displayKelas = GlobalData.kelas.isNotEmpty ? GlobalData.kelas : "04SIFP010";

    List<String> listHobi = GlobalData.hobi.isNotEmpty 
        ? GlobalData.hobi.split(', ') 
        : ['Coding', 'Desain Grafis', 'Networking'];

    String displaySummary = GlobalData.summary.isNotEmpty ? GlobalData.summary : "Mahasiswa Sistem Informasi...";
    String displayExperience = GlobalData.experience.isNotEmpty ? GlobalData.experience : "Berpengalaman dalam...";

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            // --- HEADER & FOTO PROFIL  ---
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  child: Container(
                    width: double.infinity,
                    height: 230,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/back.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Foto Profil
                Positioned(
                  bottom: -60,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/foto.jpeg'),
                      radius: 65.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 75), 
            
            // --- NAMA & BIO SINGKAT ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowSummaryPage(
                        summary: displaySummary,
                        experience: displayExperience,
                      ),
                    ),
                  );
                },
                child: Text(
                  displayNama,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Color(0xFF2D3142), 
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Sistem Informasi • Universitas Pamulang",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            
            // --- INFORMASI AKADEMIK ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAcademicBadge(Icons.badge, displayNim, Colors.blue),
                const SizedBox(width: 12),
                _buildAcademicBadge(Icons.domain, displayKelas, Colors.teal),
              ],
            ),
            const SizedBox(height: 25),

            // --- Edit Profil & Bagikan ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text("Edit Profil"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share, size: 18),
                      label: const Text("Bagikan"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        side: const BorderSide(color: Colors.blueAccent),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // --- STATISTIK ---
            Card(
              color: Colors.white,
              elevation: 3,
              shadowColor: Colors.blue.withOpacity(0.1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem("Project", "87", Icons.code),
                    Container(height: 50, width: 1, color: Colors.grey.shade200),
                    _buildStatItem("Followers", "1M", Icons.people_alt),
                    Container(height: 50, width: 1, color: Colors.grey.shade200),
                    _buildStatItem("Rating", "4.9", Icons.star_rounded),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),

            // --- DATA HOBI & BAKAT ---
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(8)),
                          child: Icon(Icons.bolt, color: Colors.orange.shade600, size: 20),
                        ),
                        const SizedBox(width: 12),
                        const Text("Hobi & Bakat", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: listHobi.map((hobi) => Chip(
                        label: Text(hobi, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey.shade300),
                        labelStyle: TextStyle(color: Colors.grey.shade800),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      )).toList(),
                    ),
                  ],
                ),
              ),
            ),

            // --- MENU PENGATURAN  ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5, bottom: 10),
                    child: Text("Pengaturan & Lainnya", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5)),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(Icons.settings_outlined, "Pengaturan Akun"),
                        _buildDivider(),
                        _buildMenuItem(Icons.lock_outline, "Privasi & Keamanan"),
                        _buildDivider(),
                        _buildMenuItem(Icons.help_outline, "Pusat Bantuan"),
                        _buildDivider(),
                        _buildMenuItem(Icons.logout, "Keluar", isDestructive: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildAcademicBadge(IconData icon, String text, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color.shade700),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: color.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey.shade400, size: 22),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(color: Color(0xFF2D3142), fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }


  Widget _buildMenuItem(IconData icon, String title, {bool isDestructive = false}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive ? Colors.red.shade50 : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: isDestructive ? Colors.red : Colors.grey.shade700, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDestructive ? Colors.red : Colors.grey.shade800,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      onTap: () {

      },
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, color: Colors.grey.shade100, indent: 60, endIndent: 20);
  }
}