import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBrown = Color(0xFF5C4033);
  static const Color secondaryGold = Color(0xFFD4AF37);
  static const Color creamBackground = Color(0xFFF5E6D3);
  static const Color darkBrown = Color(0xFF3E2723);
  static const Color lightCream = Color(0xFFFEFBF7);
  static const Color accentRed = Color(0xFFE53935);
  static const Color mediumBrown = Color(0xFF8B6F47);
  static const Color lightGray = Color(0xFFD7CCC8);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningYellow = Color(0xFFFFC107);
  static const Color whatsappGreen = Color(0xFF25D366);

  static const Color darkBackground = Color(0xFF1A1A1A);
  static const Color darkSurface = Color(0xFF2D2D2D);
}

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
  static const double xxxxl = 64;
}

class AppRadius {
  static const double small = 4;
  static const double medium = 8;
  static const double large = 12;
  static const double extraLarge = 16;
  static const double full = 50;
}

class AppShadows {
  static List<BoxShadow> elevation1 = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];
  static List<BoxShadow> elevation2 = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];
  static List<BoxShadow> elevation3 = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.15),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];
}

class AppConstants {
  static const String whatsappNumber = '966560514370';
  static const String phoneNumber = '+966 56 051 4370';
  static const String email = 'Roaafaisal07@gmail.com';
  static const String instagram = 'https://www.instagram.com/_pascake?igsh=MXhzMnp0dHdqd3V3aA==';
  static const String address = 'المنطقة الشرقية، الدمام/الخبر';
  static const String workHours = '9 صباحاً - 11 مساءً';
  static const String appName = 'Pascake';
  static const String tagline = 'Life is too short to make it sweet';
}
