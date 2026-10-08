import 'package:flutter/material.dart';

void main() => runApp(const BiodataApp());

const String fullName = 'Angelotud';
const String tagline = 'IT Student | UI/UX Prototyper';

const Map<String, String> personalInfo = {
  'Birthdate': '04, 10, 2006',
  'Age': '20',
  'Address': 'City, Philippines',
  'Email': 'angelodelossantostud@email.com',
  'Phone': '+63 961 4275 658',
};

const List<Map<String, String>> education = [
  {
    'school': 'GRC',
    'program': 'Bachelor of Science in Information Technology',
    'year': '2022 - Present',
  },
  {
    'school': 'Your Senior High School',
    'program': 'GAS',
    'year': '2021 - 2022',
  },
];

const List<String> skills = [
  'Figma',
  'UI/UX Design',
  'Teamwork',
];

const String about =
    'A motivated IT student who enjoys designing and building user-friendly '
    'apps. Eager to learn, collaborate, and grow in the tech industry.';

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surfaceContainerLowest,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Header(scheme: scheme),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _SectionCard(
                    title: 'About Me',
                    icon: Icons.person_outline,
                    child: const Text(about, style: TextStyle(height: 1.5)),
                  ),
                  _SectionCard(
                    title: 'Personal Information',
                    icon: Icons.badge_outlined,
                    child: Column(
                      children: personalInfo.entries
                          .map((e) => _InfoRow(label: e.key, value: e.value))
                          .toList(),
                    ),
                  ),
                  _SectionCard(
                    title: 'Education',
                    icon: Icons.school_outlined,
                    child: Column(
                      children: education
                          .map((e) => _EducationTile(data: e))
                          .toList(),
                    ),
                  ),
                  _SectionCard(
                    title: 'Skills',
                    icon: Icons.bolt_outlined,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: skills
                          .map(
                            (s) => Chip(
                              label: Text(s),
                              backgroundColor: scheme.primaryContainer,
                              side: BorderSide.none,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.scheme});
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 72, bottom: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primary, scheme.tertiary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            backgroundImage: const AssetImage(
              'assets/blank-profile-picture-973460_640.png',
            ),
          ),
          const SizedBox(height: 16),
          Text(
            fullName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            tagline,
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: scheme.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: scheme.primary,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            child,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class _EducationTile extends StatelessWidget {
  const _EducationTile({required this.data});
  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['school'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 2),
          Text(data['program'] ?? ''),
          Text(
            data['year'] ?? '',
            style: const TextStyle(color: Colors.black54, fontSize: 13),
          ),
        ],
      ),
    );
  }
}