import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String facultyName =
        ModalRoute.of(context)!.settings.arguments as String;

    // Data fakultas
    final Map<String, dynamic> facultyData = _getFacultyData(facultyName);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $facultyName'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(facultyData['logoPath']),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildDetailItem('Profil', facultyData['profil']),
                Divider(),
                _buildVisiItem('Visi', facultyData['visi']),
                Divider(),
                _buildMisiItem('Misi', facultyData['misi']),
                Divider(),
                _buildDetailItem('Akreditasi', facultyData['akreditasi']),
                Divider(),
                _buildDetailItem(
                    'Ketua Program Studi', facultyData['ketua_prodi']),
                Divider(),
                _buildDosenItem('Dosen', facultyData['dosen']),
                Divider(),
                _buildWebsiteItem('Website Resmi', facultyData['website'], facultyData['website']),
                Divider(),
                _buildDetailItem(
                    'Prestasi Mahasiswa', _formatList(facultyData['prestasi'])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String? logoPath) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(logoPath ?? 'assets/default_image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String content) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildVisiItem(String title, List<String> items) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .asMap()
            .map((index, item) => MapEntry(
              index,
              Padding(
                padding: EdgeInsets.only(top: index == 0 ? 0 : 8.0),
                child: Text(
                  '• $item',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ))
            .values
            .toList(),
      ),
    );
  }

  Widget _buildMisiItem(String title, List<String> items) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .asMap()
            .map((index, item) => MapEntry(
              index,
              Padding(
                padding: EdgeInsets.only(top: index == 0 ? 0 : 8.0),
                child: Text(
                  '• $item',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ))
            .values
            .toList(),
      ),
    );
  }

  Widget _buildDosenItem(String title, List<String> dosenList) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dosenList.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildDosenCard(dosenList[index]);
          },
        ),
      ),
    );
  }

  Widget _buildDosenCard(String dosenName) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/icon.jpeg'), // Ganti dengan foto dosen
          ),
          SizedBox(height: 8),
          Text(
            dosenName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildWebsiteItem(String title, String content, String? websiteUrl) {
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
          content,
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
      ),
    );
  }

  Map<String, dynamic> _getFacultyData(String facultyName) {
    Map<String, dynamic> facultyData = {
      'Manajemen': {
        'logoPath': 'assets/mnj.png',
        'profil': 'Program Studi S1 Manajemen didirikan pada bulan Maret 1966 di bawah Fakultas Ekonomi (kemudian dikenal sebagai Fakultas Ekonomi dan Bisnis). Dalam tahun-tahun pendiriannya, telah menjadi salah satu puncak dan dicari program studi di UPNVJT, menarik sejumlah besar siswa setiap tahun (sekitar 300-350 siswa per tahun akademik). Program ini juga secara teratur disebut sebagai program paling favorit dalam bidang studi manajemen ekonomi di Surabaya-Jawa Timur (data dan manajemen statistik tersedia dalam lampiran). Selain itu, program ini telah secara teratur diakreditasi oleh BAN-PT (Badan Akreditasi Nasional) dengan status “A” (status luar biasa)',
        'visi': [
          '“Menjadi salah satu program studi yang unggul dalam pengembangan Ilmu Manajemen yang berkarakter bela negara pada tahun 2024”'
        ],
        'misi': [
          'Menyelenggarakan pendidikan bidang manajemen yang berkarakter bela negara',
          'Meningkatkan pengembangan ilmu manajemen melalui kegiatan penelitian',
          'Melaksanakan pengabdian kepada masyarakat melalui karya inovatif berbasis iptek dan kearifan lokal.',
          'Menyelenggarakan tata kelola yang baik dan bersih dalam rangka mencapai akuntabilitas pengelolaan anggaran',
          'Mengembangkan kualitas sumber manusia unggul dalam sikap dan tata nilai, unjuk rasa, penguasaan pengetahuan dan manajerial.',
          'Meningkatkan sistem pengelolaan sarana dan prasarana terpadu serta tersedianya infrastruktur dan fasilitas pendidikan yang berkeadilan dan dapat menunjang kebutuhan inklusi',
          'Membangun jejaring dengan institusi baik nasional dan internasional melalui Implementasi kerjasama.',
        ],
        'akreditasi': 'A (Terakreditasi) dan FIBAA',
        'ketua_prodi': 'Dra. Ec. Nurjanti Takarini, M.Si.',
        'dosen': ['Dra.Ec. Nurjanti Takarini, M.Si', 'Dr. Dra. Ika Korika Swasti, M.Pd', 'Dr. Muhadjir Anwar, M.M., CFP'],
        'website': 'https://manajemen.upnjatim.ac.id',
        'prestasi': [
          'Juara 1 National Economic Business Plan Comp. Festival 2022',
          'Juara 3 LENS (Lomba Esai Nasional) Chemistry Friendship Competition V 2022',
          'Juara 3 E-Sport PUBG Mobile Brawijaya Tournament 2022',
          'Juara 3 Lomba Essay Aection 4.0 Himavo Akmapesa IPB University'
        ],
      },

      'Akuntansi': {
        'logoPath': 'assets/akt.png',
        'profil': 'Berdasarkan Surat Keputusan Menteri Urusan Veteran dan Demobilisasi Nomor ; 133/kpts/1966 tentang Pengintegrasian Akademi Administrasi Perusahaan “Veteran” Surabaya pada Perguruan Tinggi Pembangunan Nasional “Veteran” Yogyakarta, berdirilah Program Studi Akuntansi. Program Studi Akuntansi didirikan pada tanggal 1 April 1966 dengan status kedinasan. Dalam perkembangannya, pada tanggal 29 November 1994, berdasarkan Surat Keputusan Bersama Menteri Pendidikan dan Kebudayaan Republik Indonesia dan Menteri Pertahanan Keamanan Republik Indonesia Nomor 0307/0/1994 dan KEP/10/Xl/1994, Program Studi Akuntansi berubah menjadi Perguruan Tinggi Swasta dengan memiliki status akreditasi. Pada tanggal 27 Februari 1995, Program studi Akuntansi ditetapkan menjadi status disamakan melalui Surat Keputusan Menteri Pendidikan dan Kebudayaan Republik Indonesia Nomor 023/D/O/1995. Pada tanggal 29 Januari 2009, Program Studi Akuntansi memperoleh Akreditasi A dari BAN-PT Depdiknas Nomor: 039/BANPT/Ak-Xl/S1/l/2009. Setelah itu, berturut-turut pada tahun 2014 dan 2019, program studi Akuntansi berhasil mempertahankan Akreditasi A dari BAN-PT.',
        'visi': [
          '“Menjadi Jurusan Akuntansi world class Unggul Berkarakter Bela Negara di tahun 2039"',
        ],
        'misi': [
          'Menyelenggarakan dan mengembangkan pendidikan bidang akuntansi yang berkarakter bela negara guna membentuk pelajar berjiwa Pancasila yang kompeten di tingkat internasional.',
          'Meningkatkan kemampuan riset dan iptek di bidang akuntansi yang berdayaguna untuk meningkatkan transparansi dan akuntabilitas dalam bermasyarakat dan bernegara.',
          'Menyelenggarakan pengabdian kepada masyarakat berbasis riset bidang akuntansi dan kearifan lokal.'
          'Menyelenggarakan tata kelola yang baik dan bersih dalam rangka mencapai akuntabilitas pengelolaan keuangan yang WBK (wilayah bebas korupsi) dan WBBM (wilayah bebas bersih melayani) di Jurusan akuntansi.',
          'Mengembangkan kualitas sumber daya manusia unggul dalam sikap dan tata nilai, unjuk kerja, penguasaan pengetahuan dan manajerial di bidang akuntansi.',
          'Meningkatkan sistem pengelolaan sarana dan prasarana terpadu di Jurusan akuntansi.',
          'Meningkatkan kerjasama institusional dengan stakeholder baik dalam dan luar negeri di bidang akuntansi.'
        ],
        'akreditasi': 'A (Terakreditasi) dan FIBAA',
        'ketua_prodi': 'Dr. Dra. Ec. Endah Susilowati, M.Si, CFrA, CBV, CMA',
        'dosen': ['Dr. Dra. Ec. Endah Susilowati, M.Si, CFrA, CBV, CMA', 'Prof. Dr. Sri Trisnaningsih, M.Si, CFrA', 'Prof. Dr. Indrawati Yuhertiana, MM., Ak. CMA'],
        'website': 'https://akuntansi.upnjatim.ac.id/',
        'prestasi': [
          'Juara I National Accounting Essay Competition 2022 Komunitas Jago Akuntansi Indonesia (KJAI)',
          'Juara I Kompetisi Akuntansi Sebelas Maret (KAS 2022)',
          'Juara III National Public Essay Competition Reviresco Reformation XXIX',
          'Medali Emas Bidang Ekonomi dalam OSAN (Olimpiade Sains Akbar Nasional) 2022'
        ],
      },

      'Ekonomi Pembangunan': {
        'logoPath': 'assets/ep.png',
        'profil': 'Program Studi Ekonomi Pembangunan Fakultas Ekonomi dan Bisnis UPNV Jawa Timur didirikan pada tahun 1974 dengan ijin pendirian dari Departemen Pertahanan Keamanan (Dephankam) dengan status “Negeri Kedinasan”. Hal ini terjadi karena pada saat itu UPN “Veteran” Jawa Timur merupakan Perguruan tinggi Kedinasan yang berada di dibawah pengelolaan Departemen Pertahanan Keamanan. Pada tahun 1994 berdasarkan Surat Keputusan Bersama Mendikbud dan Menhankam Nomor : Kep/0307/U/1994-10/XI/1994 tanggal 29 November 1994 tentang Peningkatan Pengabdian UPN “Veteran” Jawa Timur melalui Pelaksanaan Keterkaitan dan Kesepadanan, maka status UPN “Veteran” beralih dari Perguruan Tinggi Kedinasan menjadi Perguruan Tinggi Swasta. Dalam proses perkembangan pengelolaan Tri Dharma Perguruan Tinggi, Program Studi  Ekonomi Pembangunan telah melakukan berbagai upaya untuk meningkatkan kualitas lulusan, seperti peningkatan kualitas dan kuantitas sarana dan prasarana, peningkatan kualitas  sumber daya manusia (dosen dan tenaga kependidikan), perbaikan kurikulum, memperbanyak dan memanfaatkan kerjasama dengan pemerintah maupun swasta.',
        'visi': [
          'Menjadi Program Studi Ekonomi Pembangunan yang unggul dalam penerapan dan pengembangan IPTEK di bidang Ekonomi Pembangunan yang memiliki karakter bela negara.',
        ],
        'misi': [
          'Menyelenggarakan dan mengembangkan pendidikan di bidang Ekonomi Pembangunan berkarakter bela negara.',
          'Meningkatkan budaya riset dalam pengembangan bidang IPTEK yang berdaya guna untuk kesejahteraan masyarakat.',
          'Menyelenggarakan pengabdian kepada masyarakat berbasis riset dan kearifan lokal.'
          'Menyelenggarakan tata kelola yang baik dan bersih dalam rangka mencapai akuntabilitas pengelolaan anggaran.',
          'Mengembangkan kualitas sumber daya manusia unggul dalam sikap dan tata nilai, unjuk kerja, penguasaan pengetahuan, dan manajerial.',
          'Meningkatkan kerja sama institusional dengan stakeholders baik dalam dan luar negeri.'
        ],
        'akreditasi': 'A (Terakreditasi) dan FIBAA',
        'ketua_prodi': 'Riko Setya Wijaya, S.E., M.M',
        'dosen': ['Riko Setya Wijaya, S.E., M.M', 'Prof. Dr. Syamsul Huda, S.E., M.T.', 'Dr. Ignatia Martha, S.E., M.E.'],
        'website': 'https://ekbang.upnjatim.ac.id/',
        'prestasi': [
          'Juara 1 Tunggal Putra ITS Open Tennis 2022',
          'Grand Finalist East Java Region dan 5th Place National Region Esport Valorant MGA University Championship S2 2022',
          'Best Speaker dalam National Business Plan Competition',
          'Juara 1 PUBG mobile competition + Golden Tiket To PVP Esport SEA 2021'
        ],
      },

      'Kewirausahaan': {
        'logoPath': 'assets/kwu.png',
        'profil': 'Program Studi Kewirausahaan adalah bagian dari Fakultas Ekonomi dan Bisnis UPN "Veteran" Jawa Timur',
        'visi': [
          'Menjadi program studi kewirausahaan yang mengutamakan inovasi dan kreativitas berbasis kearifan lokal dengan memanfaatkan teknologi informasi dalam pengembangan ilmu kewirausahaan yang berkarakter Bela Negara.'
        ],
        'misi': [
          'Menyelenggarakan dan mengembangkan pendidikan di bidang kewirausahaan yang berbasis digital dan berkarakter bela negara.',
          'Meningkatkan budaya riset dalam pengembangan bidang IPTEK yang berdaya guna untuk kesejahteraan masyarakat.',
          'Menyelenggarakan pengabdian kepada masyarakat berbasis riset dan kearifan lokal.'
          'Menyelenggarakan tata kelola yang baik dan bersih untuk mencapai akuntabilitas pengelolaan anggaran.',
          'Mengembangkan kualitas sumber daya manusia unggul dalam sikap dan tata nilai, unjuk kerja, penguasaan pengetahuan, kompetensi dan manajerial.',
          'Meningkatkan kerja sama institusional dengan stakeholders baik dalam dan luar negeri.'
        ],
        'akreditasi': 'B (Terakreditasi)',
        'ketua_prodi': 'Dr. Hesty Prima Rini, SE., MM',
        'dosen': ['Dr. Hesty Prima Rini, SE., MM', 'Arief Budiman, S.AB., M.AB., CMA', 'Devinta Nur Arumsari, S.E., M.E'],
        'website': 'https://kwu.upnjatim.ac.id/',
        'prestasi': [
          'Medali perak di kompetisi NASPO (National Applied Science Project Olympiad) 2022',
          'Medali perunggu di kompetisi AISEEF (Asean Innovative Science and Enterpreneur Fair) 2023',
        ],
      },

      'Magister Akuntansi': {
        'logoPath': 'assets/akt2.png',
        'profil': 'Program Studi Magister Akuntansi Universitas Pembangunan Nasional "Veteran" Jawa Timur berdiri pada tahun 2001 berdasarkan nomor SK Pendirian: Skep/29/VIII/2000 pada tanggal 31 Agustus 2001.',
        'visi': [
          'Menjadi Pusat Pembelajaran Ilmu Akuntansi Jenjang Magister yang Unggul dan Berkarakter Bela Negara Pada tahun 2039.',
        ],
        'misi': [
          'Menyelenggarakan pendidikan berkualitas dengan pemanfaatan hasil penelitian dan berkarakter bela negara.',
          'Menyelenggarakan penelitian strategis dan berkesinambungan untuk mengembangkan IPTEKS ekonomi dan bisnis.',
          'Menyelenggarakan pengabdian kepada masyarakat melalui penerapan TTG berbasis kearifan lokal.'
          'Menyelenggarakan tata kelola Jurusan yang baik, dan bersih.',
          'Mengembangkan kualitas sumber daya manusia berkarakter bela negara.',
          'Meningkatkan sistem pengelolaan sarana dan prasarana terpadu di tingkat Jurusan.',
          'Meningkatkan Kerjasama Institusional dalam dan luar negeri melalui keunggulan Litdimas.'
        ],
        'akreditasi': 'Baik Sekali (Terakreditasi) dan FIBAA',
        'ketua_prodi': 'Dr. Dra. Ec. Endah Susilowati, M.Si, CFrA, CBV, CMA',
        'dosen': ['Prof. Dr. Sri Trisnaningsih, M.Si, CFrA', 'Prof. Dr. Indrawati Yuhertiana, MM., Ak. CMA', 'Dr. Hero Priono, S.E., M.Si., Ak., C.A., CMA'],
        'website': 'https://mak.upnjatim.ac.id/',
        'prestasi': [
          'Untuk Magister tidak ditemui prestasi mahasiswa'
        ],
      },
      // Data untuk fakultas lainnya...
    };

    return facultyData[facultyName] ??
        {}; // Jika fakultas tidak ditemukan, kembalikan objek kosong
  }

  String _formatList(List<String> items) {
    return items.map((item) => '• $item').join('\n');
  }

  void _launchURL(String? url) async {
    if (await canLaunch(url!)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
