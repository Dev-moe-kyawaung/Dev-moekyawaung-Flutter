import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({
    super.key,
    required this.icon,
    required this.label,
    required this.percent,
  });

  final String icon;
  final String label;
  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 10),
          Text(
            '$label • $percent%',
            style: const TextStyle(color: AppColors.text, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
