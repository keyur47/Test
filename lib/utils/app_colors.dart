import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor white = MaterialColor(0xFFFFFFFF, <int, Color>{
    10: Color(0xFFFFFFFF),
    20: Color(0xFFEBEBEB),
    30: Color(0xFFFCFCFC),
    40: Color(0xFFF7F7F7),
    50: Color(0xFFE9EEF3),
    60: Color(0xFFE6E7ED),
    70: Color(0xFFB9BBCB),
    80: Color(0xFFE6E6E6),
    90: Color(0xFFC8C8C8),
    100: Color(0xFFD6D6D6),
  });

  static const MaterialColor black = MaterialColor(0xFF000000, <int, Color>{
    100: Color(0xFF000000),
  });

  static const MaterialColor backgroundColor =
      MaterialColor(0xffF7F8FE, <int, Color>{
    100: Color(0xffF7F8FE),
  });

  static const MaterialColor orange = MaterialColor(0xFFF1592A, <int, Color>{
    100: Color(0xFFF1592A),
  });
  static const MaterialColor green = MaterialColor(0xFF00852D, <int, Color>{
    100: Color(0xFF00852D),
  });
  static const MaterialColor red = MaterialColor(0xFFDD2025, <int, Color>{
    100: Color(0xFFDD2025),
  });

  static const MaterialColor boxShadowColor =
      MaterialColor(0xff58585A, <int, Color>{
    100: Color(0xff58585A),
  });

  static const MaterialColor textColor = MaterialColor(0xff9A9A9A, <int, Color>{
    100: Color(0xff9A9A9A),
    200: Color(0xff5B5B5B),
    300: Color(0xff767676),
  });
}
