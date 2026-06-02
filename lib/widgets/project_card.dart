import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../theme/app_colors.dart';
import 'glass_card.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
    this.onGithubTap,
    this.onLiveTap,
  });

  final ProjectModel project;
  final VoidCallback? onGithubTap;
  final VoidCallback? onLiveTap;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                project.category.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            project.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.text),
          ),
          const SizedBox(height: 8),
          Text(
            project.description,
            style: const TextStyle(color: AppColors.muted, height: 1.6),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tags
                .map(
                  (tag) => Chip(
                    label: Text(tag),
                    backgroundColor: Colors.white.withOpacity(0.06),
                    side: const BorderSide(color: AppColors.border),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              TextButton.icon(
                onPressed: onGithubTap,
                icon: const Icon(Icons.code),
                label: const Text('GitHub'),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: onLiveTap,
                icon: const Icon(Icons.open_in_new),
                label: const Text('Live'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
