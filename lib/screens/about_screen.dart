import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Responsive.contentWidth(context);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SectionHeader(
                eyebrow: 'About',
                title: 'Who I am and how I work',
                subtitle:
                    'I focus on turning ideas into production-ready Android experiences that feel refined, fast, and maintainable.',
              ),
              const SizedBox(height: 28),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 900;
                  return Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    children: [
                      const Expanded(
                        child: GlassCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('About me', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                              SizedBox(height: 12),
                              Text(
                                'Senior Android Developer with 12 years of experience building scalable mobile products using Kotlin, Jetpack Compose, Firebase, MVVM, and Clean Architecture.',
                                style: TextStyle(color: AppColors.muted, height: 1.8),
                              ),
                              SizedBox(height: 14),
                              Text(
                                'I care about readability, performance, and product polish. I enjoy building interfaces that feel simple to users but are structured well behind the scenes.',
                                style: TextStyle(color: AppColors.muted, height: 1.8),
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
                            children: const [
                              Text('Core principles', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                              SizedBox(height: 14),
                              _Bullet('Ship useful features fast.'),
                              _Bullet('Keep code modular and maintainable.'),
                              _Bullet('Focus on UI clarity and trust.'),
                              _Bullet('Use architecture that scales.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _infoCard('Role', PortfolioData.role),
                  _infoCard('Location', PortfolioData.location),
                  _infoCard('Timezone', PortfolioData.timezone),
                  _infoCard('Focus', 'Android + Flutter Web'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: AppColors.text, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: AppColors.secondary, size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(color: AppColors.muted, height: 1.7))),
        ],
      ),
    );
  }
}
