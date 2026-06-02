import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/section_header.dart';
import '../widgets/timeline_item.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

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
                eyebrow: 'Experience',
                title: 'Career timeline',
                subtitle: 'A concise timeline showing roles, growth, and key delivery milestones.',
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Column(
                  children: [
                    TimelineItem(
                      title: 'Senior Android Developer',
                      subtitle: 'Built production-ready apps with Kotlin, Compose, and Firebase.',
                      trailing: '2024 - Present',
                    ),
                    SizedBox(height: 18),
                    TimelineItem(
                      title: 'Android Developer',
                      subtitle: 'Improved UI systems, API integration, and app stability.',
                      trailing: '2021 - 2024',
                    ),
                    SizedBox(height: 18),
                    TimelineItem(
                      title: 'Junior Developer',
                      subtitle: 'Started building mobile apps and learning product delivery.',
                      trailing: '2014 - 2021',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
