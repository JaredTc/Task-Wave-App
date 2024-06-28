
import 'package:flutter/material.dart';
import 'package:taskwave/config/ui/colors.dart';

class AppThemes {
  static ThemeData app = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
  );
}
