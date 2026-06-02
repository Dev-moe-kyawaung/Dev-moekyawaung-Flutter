import 'package:flutter/material.dart';
import 'screens/about_screen.dart';
import 'screens/case_studies_screen.dart';
import 'screens/certificates_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/experience_screen.dart';
import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/testimonials_screen.dart';
import 'theme/app_theme.dart';

class NebulaFlowApp extends StatelessWidget {
  const NebulaFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MKA | Nebula Flow V7',
      theme: AppTheme.dark,
      home: const NebulaFlowShell(),
    );
  }
}

class NebulaFlowShell extends StatefulWidget {
  const NebulaFlowShell({super.key});

  @override
  State<NebulaFlowShell> createState() => _NebulaFlowShellState();
}

class _NebulaFlowShellState extends State<NebulaFlowShell> {
  final Map<String, GlobalKey> _keys = {
    '/': GlobalKey(),
    '/about': GlobalKey(),
    '/projects': GlobalKey(),
    '/case-studies': GlobalKey(),
    '/experience': GlobalKey(),
    '/certificates': GlobalKey(),
    '/testimonials': GlobalKey(),
    '/contact': GlobalKey(),
  };

  void _navigate(String route) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _keys[route]?.currentContext;
      if (ctx != null) {
        Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeInOutCubic,
          alignment: 0.05,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          key: _keys['/'],
          children: [
            HomeScreen(onNavigate: _navigate),
            Container(key: _keys['/about'], child: const AboutScreen()),
            Container(key: _keys['/projects'], child: const ProjectsScreen()),
            Container(key: _keys['/case-studies'], child: const CaseStudiesScreen()),
            Container(key: _keys['/experience'], child: const ExperienceScreen()),
            Container(key: _keys['/certificates'], child: const CertificatesScreen()),
            Container(key: _keys['/testimonials'], child: const TestimonialsScreen()),
            Container(key: _keys['/contact'], child: const ContactScreen()),
          ],
        ),
      ),
    );
  }
}
