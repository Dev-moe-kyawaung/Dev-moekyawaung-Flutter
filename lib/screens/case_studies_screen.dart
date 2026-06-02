import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';

class CaseStudiesScreen extends StatelessWidget {
  const CaseStudiesScreen({super.key});

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
                eyebrow: 'Case Studies',
                title: 'How projects were solved',
                subtitle: 'A simple story format that explains the challenge, process, solution, and result.',
              ),
              const SizedBox(height: 28),
              const _CaseStudyCard(
                title: 'Offline-first productivity app',
                problem: 'Users needed access to core data even when the network was unstable.',
                process: 'Designed a local-first flow with caching, state sync, and clean UI transitions.',
                solution: 'Combined local storage, sync handling, and a clear loading hierarchy.',
                result: 'Improved reliability and user confidence during weak-network sessions.',
              ),
              const SizedBox(height: 18),
              const _CaseStudyCard(
                title: 'Analytics dashboard',
                problem: 'The admin panel felt cluttered and difficult to scan quickly.',
                process: 'Rebuilt the UI with card grouping, clear hierarchy, and compact metrics.',
                solution: 'Used cleaner spacing, clearer labels, and focused data blocks.',
                result: 'Made the dashboard easier to understand at a glance.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CaseStudyCard extends StatelessWidget {
  const _CaseStudyCard({
    required this.title,
    required this.problem,
    required this.process,
    required this.solution,
    required this.result,
  });

  final String title;
  final String problem;
  final String process;
  final String solution;
  final String result;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.text)),
          const SizedBox(height: 14),
          _row('Problem', problem),
          _row('Process', process),
          _row('Solution', solution),
          _row('Result', result),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: AppColors.muted, height: 1.7),
          children: [
            TextSpan(text: '$label: ', style: const TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w800)),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
