import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1024;

  static double contentWidth(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w >= 1440) return 1240;
    if (w >= 1200) return 1100;
    if (w >= 1024) return 980;
    return w;
  }
}
