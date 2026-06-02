import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HeroOrb extends StatelessWidget {
  const HeroOrb({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 420,
          height: 420,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [Color(0x44FFFFFF), Color(0x1A8B5CF6), Color(0x0022D3EE)],
              stops: [0.0, 0.55, 1.0],
            ),
          ),
        ),
        Container(
          width: 360,
          height: 360,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.borderStrong, width: 1.2),
          ),
        ),
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.08),
                border: Border.all(color: Colors.white.withOpacity(0.16)),
              ),
              child: Center(child: child),
            ),
          ),
        ),
      ],
    );
  }
}
