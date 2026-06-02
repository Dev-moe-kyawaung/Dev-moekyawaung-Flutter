import 'package:flutter/material.dart';
import '../data/social_links.dart';
import '../theme/app_colors.dart';
import '../utils/launch_url.dart';
import '../utils/responsive.dart';
import '../widgets/contact_form.dart';
import '../widgets/section_header.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                eyebrow: 'Contact',
                title: 'Let’s build something great',
                subtitle:
                    'Reach out for Android development, UI polish, architecture help, or web portfolio work.',
              ),
              const SizedBox(height: 28),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 900;
                  return Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    children: const [
                      Expanded(child: ContactForm()),
                      SizedBox(width: 18, height: 18),
                      Expanded(child: _ContactInfo()),
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

class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.text),
          ),
          const SizedBox(height: 16),
          _row('Email', SocialLinks.email),
          _row('GitHub', 'Dev-moe-kyawaung'),
          _row('LinkedIn', 'moe-kyaw-aung-2653093a1'),
          _row('Telegram', '@moekyawaung'),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () => launchEmail(SocialLinks.email, subject: 'Project Inquiry'),
                child: const Text('Send Email'),
              ),
              OutlinedButton(
                onPressed: () => launchExternalUrl(SocialLinks.github),
                child: const Text('GitHub'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(label, style: const TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w800)),
          ),
          Expanded(child: Text(value, style: const TextStyle(color: AppColors.muted, height: 1.5))),
        ],
      ),
    );
  }
}
