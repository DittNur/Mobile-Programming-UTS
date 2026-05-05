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
      backgroundColor: Colors.white,
      body: page[currentPage], 
    );
  }

  Widget _buildProfileUI(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/back.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: const Alignment(0.0, 2.5),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('images/foto.jpeg'),
                  radius: 60.0,
                ),
              ),
            ),
            const SizedBox(height: 60),
            
            InkWell(
              onTap: () {
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
              child: const Text(
                "Aditya Nurrohmat",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline, 
                  decorationColor: Colors.blueGrey,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "241011701296",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "04SIFP010",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 7),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            "Project",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "87",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            "Followers",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "1M",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}