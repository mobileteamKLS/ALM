import 'package:flutter/material.dart';
import '../core/dimensions.dart';
import '../utils/media_query.dart';
import 'app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.textFieldBorderColor,
          textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary),
          textStyle: const TextStyle(
            fontSize: 18,
            color: AppColors.primary,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          minimumSize: const Size.fromHeight(50),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 18,
            color: AppColors.primary,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          minimumSize: const Size.fromHeight(50),
        ),
      ),
      iconButtonTheme: const IconButtonThemeData(),
  );
}

class AppStyle{
  static TextStyle sideTitleText = TextStyle(
    color: AppColors.textColorSecondary,
    fontSize: ScreenDimension.textSize * bodyTextMedium,
    fontWeight: FontWeight.w700,
  );

  static TextStyle screenHeading = TextStyle(
    color: AppColors.textColorPrimary,
    fontSize: ScreenDimension.textSize * titleText,
    fontWeight: FontWeight.w700,
  );

  static TextStyle sideDescText = TextStyle(
    color: AppColors.textColorSecondary,
    fontSize: ScreenDimension.textSize * bodyTextSmall,
    fontWeight: FontWeight.w500,
  );
}


class AppBarPainterGradient extends CustomPainter {
  @override
  bool shouldRepaint(AppBarPainterGradient oldDelegate) => false;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    const Gradient gradient = LinearGradient(
      colors: [
        Color(0xff0060e6),
        Color(0xFF1c86ff),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    Paint paint_1 = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.08, 0.0)
      ..cubicTo(
        size.width * 0.04,
        0.0,
        0.0,
        0.0001 * size.width,
        0.0,
        0.06 * size.width,
      );

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * 0.92, 0.0)
      ..cubicTo(
        size.width * 0.96,
        0.0,
        size.width,
        0.0001 * size.width,
        size.width,
        0.09 * size.width,
      );

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    // canvas.drawPath(path_3, paint_2);
  }
}
