import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView Demo',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: ListPage(),
    );
  }
}


class Pertemuan {
  final String title;
  final String subtitle;

  Pertemuan({required this.title, required this.subtitle});
}


class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // Data list pertemuan
  final List<Pertemuan> daftarPertemuan = [
    Pertemuan(title: 'Pertemuan 1', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 2', subtitle: 'Widget & Button'),
    Pertemuan(title: 'Pertemuan 3', subtitle: 'Activity & Intent'),
    Pertemuan(title: 'Pertemuan 4', subtitle: 'Toast & AlertDialog'),
    Pertemuan(title: 'Pertemuan 5', subtitle: 'ListView'),
    Pertemuan(title: 'Pertemuan 6', subtitle: 'Checkbox'),
    Pertemuan(title: 'Pertemuan 7', subtitle: 'Radio Button'),
  ];

  // Fungsi dengan logika if-else untuk menentukan ikon
  IconData _tentukanIkon(String judul) {
    if (judul == 'Pertemuan 1') {
      return Icons.phone_android;
    } else if (judul == 'Pertemuan 2') {
      return Icons.widgets;
    } else if (judul == 'Pertemuan 3') {
      return Icons.touch_app;
    } else if (judul == 'Pertemuan 4') {
      return Icons.warning_amber_rounded;
    } else if (judul == 'Pertemuan 5') {
      return Icons.format_list_bulleted;
    } else if (judul == 'Pertemuan 6') {
      return Icons.check_box;
    } else if (judul == 'Pertemuan 7') {
      return Icons.radio_button_checked;
    } else {
      return Icons.book; // Ikon default jika tidak ada yang cocok
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      appBar: AppBar(
        title: const Text(
          "Daftar Materi Kuliah",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10), 
        itemCount: daftarPertemuan.length,
        itemBuilder: (context, index) {
          final item = daftarPertemuan[index];
          
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), 
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
                child: Icon(
                  _tentukanIkon(item.title), 
                  color: Colors.blueAccent,
                ),
              ),
              title: Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  item.subtitle,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PertemuanPage(pertemuan: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// --- HALAMAN DETAIL ---
class PertemuanPage extends StatelessWidget {
  final Pertemuan pertemuan;

  const PertemuanPage({Key? key, required this.pertemuan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pertemuan.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topik Pembahasan:",
                    style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    pertemuan.subtitle,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Deskripsi Materi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              "Ini adalah halaman detail untuk ${pertemuan.title}. Di sini Anda bisa menambahkan penjelasan panjang, gambar, atau komponen interaktif lainnya yang berkaitan dengan materi ${pertemuan.subtitle}.",
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}