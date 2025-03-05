import 'package:alm/core/dimensions.dart';
import 'package:alm/theme/app_colors.dart';
import 'package:alm/utils/media_query.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenDimension().init(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // White background filling the entire screen
          Container(
            color: Colors.white,
          ),

          // Centered ALM Logo
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ALM Logo with custom styling
                Text(
                  'ALM',
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),

          // Positioned curved blue bottom section
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                ),
                child: Center(
                  child: Text(
                    'Kale Logistics Solution®',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from bottom left
    path.moveTo(0, size.height * 0.1);

    // Create a curved line to bottom right
    path.quadraticBezierTo(
        size.width / 2,
        size.height* 0.4,
        size.width,
        size.height * 0.1
    );

    // Draw lines to create the shape
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

