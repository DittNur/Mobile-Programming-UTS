import 'package:flutter/material.dart';
import 'package:flutter_uts2/pertemuan/pertemuan1.dart';
import 'package:flutter_uts2/pertemuan/pertemuan2.dart';
import 'package:flutter_uts2/pertemuan/pertemuan3.dart';
import 'package:flutter_uts2/pertemuan/pertemuan4.dart';
import 'package:flutter_uts2/pertemuan/pertemuan5.dart';
import 'package:flutter_uts2/pertemuan/pertemuan6.dart';
import 'package:flutter_uts2/pertemuan/pertemuan7.dart';
import 'package:flutter_uts2/pertemuan/pertemuan8.dart';


class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
    "title": "Pertemuan 1",
    "subtitle": "Materi Pengenalan Flutter",
    "icon": Icons.auto_stories,
    "color": Colors.red,
    "page": Pertemuan1Page(), // Ganti sesuai nama class di file kamu
  },
  {
    "title": "Pertemuan 2",
    "subtitle": "Materi Widget & Button",
    "icon": Icons.auto_stories,
    "color": Colors.pink,
    "page": Pertemuan2Page(),
  },
  {
    "title": "Pertemuan 3",
    "subtitle": "Materi Create Form Produk",
    "icon": Icons.auto_stories,
    "color": Colors.purple,
    "page": Pertemuan3Page(),
  },
  {
    "title": "Pertemuan 4",
    "subtitle": "Materi Toast Allert",
    "icon": Icons.auto_stories,
    "color": Colors.indigo,
    "page": Pertemuan4Page(),
  },
    {
      "title": "Pertemuan 5",
      "subtitle": "Materi List View",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": ListPage(),
    },
    {
      "title": "Pertemuan 6",
      "subtitle": "Materi Checkbox",
      "icon": Icons.auto_stories,
      "color": Colors.green,
      "page": CheckboxPage(),
    },
    {
      "title": "Pertemuan 7",
      "subtitle": "Materi Radio Button",
      "icon": Icons.auto_stories,
      "color": Colors.orange,
      "page": RadiobuttonPage(),
    },
    {
      "title": "Pertemuan 8",
      "subtitle": "Materi Auto Complete Dan Spinner",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": AutocompletespinPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // --- PERUBAHAN DI SINI: Dari GridView ke ListView ---
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return _buildMenuListTile(
            context,
            title: item['title'],
            subtitle: item['subtitle'],
            icon: item['icon'],
            color: item['color'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item['page']),
              );
            },
          );
        },
      ),
    );
  }

  // --- WIDGET BARU: Menggunakan ListTile agar bentuknya List ---
  Widget _buildMenuListTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12), // Memberi jarak antar list
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 28,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}