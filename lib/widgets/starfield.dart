import 'dart:math';
import 'package:flutter/material.dart';

class StarFieldBackground extends StatefulWidget {
  const StarFieldBackground({super.key});

  @override
  State<StarFieldBackground> createState() => _StarFieldBackgroundState();
}

class _StarFieldBackgroundState extends State<StarFieldBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int starCount = 140;
  final List<Offset> positions = [];
  final Random rand = Random();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < starCount; i++) {
      positions.add(Offset(rand.nextDouble(), rand.nextDouble()));
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return CustomPaint(
            painter: _StarPainter(positions, _controller.value),
          );
        },
      ),
    );
  }
}

class _StarPainter extends CustomPainter {
  final List<Offset> stars;
  final double progress;
  _StarPainter(this.stars, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(.8);

    for (var star in stars) {
      final dx = (star.dx * size.width) + sin(progress * 6.28) * 4;
      final dy = (star.dy * size.height) + cos(progress * 6.28) * 4;

      canvas.drawCircle(Offset(dx, dy), 1.4, paint);
    }
  }

  @override
  bool shouldRepaint(_) => true;
}
