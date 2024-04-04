
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'prodi_detail.dart';
import 'profile_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fakultas Ekonomi dan Bisnis',
      theme: ThemeData(
        primarySwatch:
            Colors.blueGrey, // Ubah primarySwatch ke warna biru keabu-abuan
      ),
      home: const HomePage(),
      routes: {
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fakultas Ekonomi dan Bisnis'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade200,
                    Colors.green.shade200
                  ], // Ubah gradasi warna
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Selamat Datang di Fakultas Ekonomi dan Bisnis',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Fakultas Ekonomi dan Bisnis adalah salah satu dari 8 fakultas di UPN "Veteran" Jawa Timur. Yang terdiri dari program studi :',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            launch('https://febis.upnjatim.ac.id/');
                          },
                          child: const Text(
                            '🌐 febis.upnjatim.ac.id',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            launch('mailto:febis@upnjatim.ac.id');
                          },
                          child: const Text(
                            '✉ febis@upnjatim.ac.id',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildFacultyCard(context, 'Manajemen', 'assets/logo mnj.jpg',
                    Colors.blueGrey),
                _buildFacultyCard(context, 'Akuntansi', 'assets/logo akt.jpg',
                    Colors.blueGrey),
                _buildFacultyCard(context, 'Ekonomi Pembangunan',
                    'assets/logo ep.jpg', Colors.blueGrey),
                _buildFacultyCard(context, 'Kewirausahaan',
                    'assets/logo kwu.jpg', Colors.blueGrey),
                _buildFacultyCard(context, 'Magister Akuntansi',
                    'assets/logo akt - Copy.jpg', Colors.blueGrey),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.blue[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildProfileSection(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFacultyCard(BuildContext context, String facultyName,
      String logoPath, Color backgroundColor) {
    return Card(
      elevation: 2,
      color: backgroundColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: facultyName);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                logoPath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                facultyName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildProfileAvatar(
              context,
              'Najoan Rizki Pradana',
              'assets/foto_jo.jpeg',
              'Mojokerto, 8 Juni 2004',
              'Desa Pagerjo, Kecamatan Gedeg, Kabupaten Mojokerto',
              '081938729358',
              'najoanrizki5@gmail.com',
              ['S1 Sistem Informasi, UPN "Veteran" Jawa Timur'],
              'https://github.com/kiraruu',
              [
                '-',
              ]),
          _buildProfileAvatar(
              context,
              'Zahrah Hayat Arka Putri',
              'assets/ark.jpg',
              'Pangkal Pinang, 27 Agustus 2005',
              'Jl. Jemur Andayani 1, Kel. Siwalankerto, Kec. Wonocolo, Kota Surabaya, Prov. Jawa Timur',
              '0895382155800',
              'zahraarkaputri@gmail.com',
              [
                'S1 Sistem Informasi, UPN "Veteran" Jawa Timur',
              ],
              'https://github.com/arkanaeru',
              [
                'Awardee of PKM-KC SIMBELMAWA',
              ]),
        ],
      ),
    );
  }

  Widget _buildProfileAvatar(
      BuildContext context,
      String name,
      String avatarPath,
      String birthplace,
      String address,
      String phoneNumber,
      String email,
      List<String> educationHistory,
      String github,
      List<String> awards) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileDetailPage(
                  name: name,
                  avatarPath: avatarPath,
                  birthplace: birthplace,
                  address: address,
                  phoneNumber: phoneNumber,
                  email: email,
                  educationHistory: educationHistory,
                  github: github,
                  awards: awards,
                ),
              ),
            );
          },
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(avatarPath),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
