import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';
import '../widgets/certificate_card.dart';
import '../widgets/section_header.dart';

class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({super.key});

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
                eyebrow: 'Certificates',
                title: 'Trusted credentials',
                subtitle: 'A small, clean grid of certificates and learning milestones.',
              ),
              const SizedBox(height: 28),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 1000
                      ? 3
                      : constraints.maxWidth >= 700
                          ? 2
                          : 1;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: PortfolioData.certificates.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return CertificateCard(certificate: PortfolioData.certificates[index]);
                    },
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
