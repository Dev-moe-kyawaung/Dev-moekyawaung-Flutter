import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class NebulaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NebulaAppBar({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  @override
  Size get preferredSize => const Size.fromHeight(84);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 24,
      title: const Text(
        'MKA.V7',
        style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: -1, fontSize: 26),
      ),
      actionsPadding: const EdgeInsets.only(right: 16),
      actions: [
        TextButton(onPressed: onHomeTap, child: const Text('Home')),
        TextButton(onPressed: onAboutTap, child: const Text('About')),
        TextButton(onPressed: onSkillsTap, child: const Text('Skills')),
        TextButton(onPressed: onProjectsTap, child: const Text('Projects')),
        TextButton(onPressed: onContactTap, child: const Text('Contact')),
        const SizedBox(width: 12),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.text,
    );
  }
}
