import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/project_card.dart';
import '../widgets/section_header.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

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
                eyebrow: 'Projects',
                title: 'Selected work',
                subtitle: 'A compact view of featured apps, experiments, and polished production ideas.',
              ),
              const SizedBox(height: 28),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 1100
                      ? 3
                      : constraints.maxWidth >= 700
                          ? 2
                          : 1;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: PortfolioData.projects.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 0.86,
                    ),
                    itemBuilder: (context, index) {
                      return ProjectCard(
                        project: PortfolioData.projects[index],
                        onGithubTap: () {},
                        onLiveTap: () {},
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
              const _Note(
                title: 'Featured approach',
                text: 'Each project is presented with the problem, stack, outcome, and visual identity so people can scan quickly.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Note extends StatelessWidget {
  const _Note({required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: AppColors.text, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(color: AppColors.muted, height: 1.7)),
        ],
      ),
    );
  }
}
