import 'package:flutter/material.dart';
import 'dart:math' as math;
class GradientCircularProgressIndicator extends StatefulWidget {
  final double strokeWidth;
  final Duration animationDuration;
  final Color backgroundColor;
  final double targetProgress;
  final double size;

  const GradientCircularProgressIndicator({
    Key? key,
    this.strokeWidth = 4.0,
    this.animationDuration = const Duration(seconds: 1),
    this.backgroundColor = Colors.white,
    this.size = 40.0,
    required this.targetProgress,
  }) : super(key: key);

  @override
  State<GradientCircularProgressIndicator> createState() =>
      _GradientCircularProgressIndicatorState();
}

class _GradientCircularProgressIndicatorState
    extends State<GradientCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation = Tween<double>(begin: 0, end: widget.targetProgress)
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  void didUpdateWidget(GradientCircularProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetProgress != widget.targetProgress) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.targetProgress,
      ).animate(_animationController);
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: CircularProgressWithGradientPainter(
              progress: _animation.value,
              strokeWidth: widget.strokeWidth,
              backgroundColor: widget.backgroundColor,
              gradientColors: const [
                Color(0xFF0060E5), // Starting color #0060E5
                Color(0xFF1D86FF), // Ending color #1D86FF
              ],
            ),
            child: Center(
              child: Text(
                '${(_animation.value * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CircularProgressWithGradientPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final List<Color> gradientColors;

  CircularProgressWithGradientPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Create gradient shader for progress
    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      colors: gradientColors,
      startAngle: 3 * math.pi / 2,
      endAngle: 7 * math.pi / 2,
      tileMode: TileMode.clamp,
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Draw the progress arc
    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      rect,
      -math.pi / 2, // Start from top
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressWithGradientPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}