import 'package:flutter/material.dart';
import '../models/testimonial_model.dart';
import '../theme/app_colors.dart';
import 'glass_card.dart';

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    super.key,
    required this.testimonial,
  });

  final TestimonialModel testimonial;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: AppColors.accent, size: 30),
          const SizedBox(height: 12),
          Text(
            testimonial.quote,
            style: const TextStyle(color: AppColors.text, height: 1.7, fontSize: 15),
          ),
          const SizedBox(height: 16),
          Text(testimonial.name, style: const TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(testimonial.role, style: const TextStyle(color: AppColors.muted)),
        ],
      ),
    );
  }
}
