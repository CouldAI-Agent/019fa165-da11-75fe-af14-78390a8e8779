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
                    LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = constraints.maxWidth < 600 ? 1 : 2;
                        
                        return GridView.count(
                          crossAxisCount: crossAxisCount,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          childAspectRatio: constraints.maxWidth < 600 ? 1.2 : 1.1,
                          children: const [
                            TopicCard(
                              title: 'Konsep Ekologi',
                              icon: Icons.eco,
                              description:
                                  'Ekologi adalah ilmu yang mempelajari interaksi antara organisme dengan lingkungannya. Dalam konteks pelayanan publik, pemahaman ekologi memastikan pembangunan berkelanjutan dan pengelolaan sumber daya yang bijak.',
                            ),
                            TopicCard(
                              title: 'Model Pentahelix',
                              icon: Icons.hub,
                              description:
                                  'Model kolaborasi inovatif yang melibatkan lima unsur utama: Pemerintah (Government), Akademisi (Academia), Pelaku Usaha (Business), Masyarakat (Community), dan Media.',
                            ),
                            TopicCard(
                              title: 'Sinergi Pelayanan Publik',
                              icon: Icons.handshake,
                              description:
                                  'Pelayanan publik berwawasan ekologi membutuhkan kolaborasi. Pemerintah membuat kebijakan, akademisi meriset, bisnis berinvestasi, masyarakat berpartisipasi, dan media mengedukasi.',
                            ),
                            TopicCard(
                              title: 'Contoh Implementasi',
                              icon: Icons.lightbulb,
                              description:
                                  '• Pengelolaan sampah terpadu berbasis masyarakat\n• Transportasi publik rendah emisi\n• Pengembangan ruang terbuka hijau\n• Sistem mitigasi bencana kolaboratif',
                            ),
                          ],
                        );
                      },
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
