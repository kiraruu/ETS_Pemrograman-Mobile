import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileDetailPage extends StatelessWidget {
  final String name;
  final String avatarPath;
  final String birthplace;
  final String address;
  final String phoneNumber;
  final String email;
  final List<String> educationHistory;
  final String github;
  final List<String> awards;

  const ProfileDetailPage({
    Key? key,
    required this.name,
    required this.avatarPath,
    required this.birthplace,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.educationHistory,
    required this.github,
    required this.awards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200], // Ganti warna app bar
        title: Text(name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 16.0),
            _buildDetailItem('Nama:', name),
            _buildDetailItem('Tempat/ Tanggal Lahir:', birthplace),
            _buildDetailItem('Alamat:', address),
            _buildDetailItem('No. Hp:', phoneNumber),
            _buildDetailItem('Email:', email),
            _buildListDetailItem('Riwayat Pendidikan:', educationHistory),
            _buildWebsiteItem('Github:', github), // Menggunakan fungsi _buildWebsiteItem yang telah disatukan
            Divider(),
            _buildListDetailItem('Penghargaan:', awards),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: CircleAvatar(
        radius: 90,
        backgroundImage: AssetImage(avatarPath),
      ),
    );
  }

  Widget _buildWebsiteItem(String title, String? websiteUrl) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: InkWell(
        onTap: () {
          _launchURL(websiteUrl);
        },
        child: Text(
          websiteUrl ?? 'No website provided', // Handle jika websiteUrl null
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildListDetailItem(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        SizedBox(height: 4.0),
        ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                '${index + 1}. ${items[index]}',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            );
          },
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  void _launchURL(String? url) async {
    if (url != null && url.isNotEmpty) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      throw 'URL is empty or null';
    }
  }
}
