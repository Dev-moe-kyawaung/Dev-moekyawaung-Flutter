import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/glass_card.dart';
import '../widgets/hero_orb.dart';
import '../widgets/nebula_app_bar.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onNavigate});

  final void Function(String route) onNavigate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NebulaAppBar(
          onHomeTap: () => onNavigate('/'),
          onAboutTap: () => onNavigate('/about'),
          onSkillsTap: () => onNavigate('/projects'),
          onProjectsTap: () => onNavigate('/projects'),
          onContactTap: () => onNavigate('/contact'),
        ),
        _hero(context),
        const SizedBox(height: 64),
        _quickIntro(context),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _hero(BuildContext context) {
    final width = Responsive.contentWidth(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.bg, AppColors.bg2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 900;
                return Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'NEBULA FLOW V7',
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2.0,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            PortfolioData.name,
                            textAlign: isMobile ? TextAlign.center : TextAlign.left,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            PortfolioData.role,
                            textAlign: isMobile ? TextAlign.center : TextAlign.left,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            PortfolioData.tagline,
                            textAlign: isMobile ? TextAlign.center : TextAlign.left,
                            style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 17,
                              height: 1.8,
                            ),
                          ),
                          const SizedBox(height: 28),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () => onNavigate('/projects'),
                                child: const Text('View Projects'),
                              ),
                              OutlinedButton(
                                onPressed: () => onNavigate('/contact'),
                                child: const Text('Contact Me'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                            children: const [
                              _MetaPill(icon: Icons.location_on_outlined, label: 'Tachileik, Myanmar'),
                              _MetaPill(icon: Icons.schedule_outlined, label: 'GMT+6:30'),
                              _MetaPill(icon: Icons.mobile_friendly, label: 'Flutter Web'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32, height: 32),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: HeroOrb(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile.png',
                              width: 220,
                              height: 220,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.person,
                                size: 96,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _quickIntro(BuildContext context) {
    final width = Responsive.contentWidth(context);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SectionHeader(
                eyebrow: 'Profile',
                title: 'Crafting premium Android experiences',
                subtitle:
                    'This portfolio is built to present work clearly, quickly, and with a polished visual identity.',
              ),
              const SizedBox(height: 28),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 900;
                  return Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    children: const [
                      Expanded(
                        child: GlassCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('What I do', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(height: 12),
                              Text(
                                'I build Android apps with clean architecture, elegant UI, and strong delivery discipline.',
                                style: TextStyle(color: AppColors.muted, height: 1.7),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 18, height: 18),
                      Expanded(
                        child: GlassCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('What this site includes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(height: 12),
                              Text(
                                'About, skills, projects, case studies, experience, certificates, testimonials, and contact.',
                                style: TextStyle(color: AppColors.muted, height: 1.7),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaPill extends StatelessWidget {
  const _MetaPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.secondary),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: AppColors.text, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
