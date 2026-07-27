import 'package:flutter/material.dart';

void main() {
  runApp(const EkologiPentahelixApp());
}

class EkologiPentahelixApp extends StatelessWidget {
  const EkologiPentahelixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ekologi & Pentahelix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ekologi & Pelayanan Publik'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const HeroSection(),
                    const SizedBox(height: 24),
                    Text(
                      'Materi Pembelajaran',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        TopicCard(
                          title: '1. Konsep Dasar Ekologi',
                          icon: Icons.eco,
                          description:
                              'Ekologi adalah ilmu yang mempelajari interaksi timbal balik antara makhluk hidup dengan lingkungannya. Dalam konteks tata kelola pemerintahan dan pelayanan publik, ekologi memegang peran krusial. Pembangunan tidak lagi hanya mengejar pertumbuhan ekonomi, namun harus mempertimbangkan daya dukung lingkungan (carrying capacity) dan keberlanjutan (sustainability). Jika ekologi diabaikan, akan timbul eksternalitas negatif seperti krisis air bersih, polusi udara, hingga bencana alam yang pada akhirnya akan merusak kualitas pelayanan publik itu sendiri.',
                        ),
                        SizedBox(height: 16),
                        TopicCard(
                          title: '2. Model Pentahelix (Lima Pilar Kolaborasi)',
                          icon: Icons.hub,
                          description:
                              'Pentahelix adalah model kolaborasi yang menggabungkan lima unsur untuk mencapai tujuan bersama:\n\n'
                              '• Pemerintah (Government): Bertindak sebagai pembuat kebijakan, regulator, dan fasilitator. Pemerintah memastikan kerangka hukum mendukung pelayanan publik yang ramah lingkungan.\n'
                              '• Akademisi (Academia): Berperan sebagai konseptor dan peneliti. Memberikan kajian ilmiah, teknologi baru, serta inovasi tata kelola yang ramah lingkungan.\n'
                              '• Dunia Usaha (Business): Bertindak sebagai katalisator ekonomi. Melalui investasi, teknologi hijau (green tech), dan program CSR, sektor swasta turut membangun infrastruktur pelayanan publik.\n'
                              '• Masyarakat/Komunitas (Community): Merupakan akselerator dan pengguna langsung (end-user). Kesadaran dan partisipasi aktif masyarakat sangat menentukan keberhasilan program publik.\n'
                              '• Media (Media): Sebagai expander dan komunikator. Media berperan mengedukasi publik, menyebarkan informasi, dan mengawasi jalannya pelayanan publik.',
                        ),
                        SizedBox(height: 16),
                        TopicCard(
                          title: '3. Sinergi Ekologi dan Pentahelix untuk Pelayanan Publik',
                          icon: Icons.handshake,
                          description:
                              'Pelayanan publik tidak bisa hanya diselesaikan oleh pemerintah saja. Pendekatan Pentahelix memungkinkan pembagian peran yang proporsional. Misalnya, dalam menghadapi masalah sampah perkotaan:\n\n'
                              '- Pemerintah menerbitkan Perda tentang pengelolaan sampah dan membangun TPA.\n'
                              '- Akademisi menciptakan inovasi alat daur ulang atau sistem biodigester.\n'
                              '- Dunia Usaha mendanai fasilitas pengolahan sampah dan membeli produk daur ulang.\n'
                              '- Komunitas/Masyarakat secara aktif memilah sampah dari rumah tangga (Bank Sampah).\n'
                              '- Media mengampanyekan gaya hidup minim sampah (zero waste) secara masif.',
                        ),
                        SizedBox(height: 16),
                        TopicCard(
                          title: '4. Kesimpulan & Studi Kasus Implementasi',
                          icon: Icons.lightbulb,
                          description:
                              'Implementasi model Pentahelix berbasis ekologi telah terbukti sukses di berbagai program pelayanan publik, antara lain:\n\n'
                              '1. Penataan Ruang Terbuka Hijau (RTH): Kolaborasi pemkot, arsitek lanskap kampus, CSR perusahaan, komunitas pecinta lingkungan, dan promosi media pariwisata.\n'
                              '2. Transisi Transportasi Publik Rendah Emisi: Pengadaan bus listrik (pemerintah & swasta), riset baterai (akademisi), adopsi oleh warga (komunitas), dan sosialisasi rute (media).\n'
                              '3. Mitigasi Bencana Banjir: Sistem peringatan dini kolaboratif, normalisasi sungai, dan edukasi warga.\n\n'
                              'Dengan menyinergikan lima pilar tersebut, pelayanan publik yang adaptif dan ramah ekologi dapat terwujud secara efektif dan berkelanjutan.',
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const FooterSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.tertiary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Icon(
              Icons.public,
              size: 64,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              'Ekologi & Pentahelix',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Pendekatan Kolaboratif untuk Pelayanan Publik yang Berkelanjutan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  const TopicCard({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Model Pentahelix untuk Pembangunan Berkelanjutan',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Government • Academia • Business • Community • Media',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
