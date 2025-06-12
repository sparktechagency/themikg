import 'dart:math';
import 'package:flutter/material.dart';
import 'package:themikg/app/utils/app_color.dart';

class ProgressWithThumbDemo extends StatefulWidget {
  const ProgressWithThumbDemo({super.key});
  @override
  State<ProgressWithThumbDemo> createState() => _ProgressWithThumbDemoState();
}

class _ProgressWithThumbDemoState extends State<ProgressWithThumbDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // match image bg
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return CustomPaint(
              size: const Size(100, 100),
              painter: _RotatingArcPainter(progress: _controller.value),
            );
          },
        ),
      ),
    );
  }
}

class _RotatingArcPainter extends CustomPainter {
  final double progress;
  final double strokeWidth = 10.0;
  final double arcLength = pi * 1.5; // ~270°

  _RotatingArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final startAngle = 0.0;

    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: arcLength,
      colors: [
        AppColors.primaryColor,
        AppColors.primaryColor.withOpacity(0.0),
      ],
      stops: const [0.0, 1.0],
      transform: GradientRotation(2 * pi * progress),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, arcLength, false, paint);
  }

  @override
  bool shouldRepaint(covariant _RotatingArcPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
