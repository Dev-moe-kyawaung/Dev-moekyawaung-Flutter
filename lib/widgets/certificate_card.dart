import 'package:flutter/material.dart';
import '../models/certificate_model.dart';
import '../theme/app_colors.dart';
import 'glass_card.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({
    super.key,
    required this.certificate,
    this.onTap,
  });

  final CertificateModel certificate;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.workspace_premium, color: AppColors.secondary),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    certificate.badge,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              certificate.title,
              style: const TextStyle(color: AppColors.text, fontSize: 20, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 6),
            Text(certificate.issuer, style: const TextStyle(color: AppColors.muted)),
            const SizedBox(height: 10),
            Text(
              certificate.year,
              style: const TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
