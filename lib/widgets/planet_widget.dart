import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lottie/lottie.dart';

class PlanetWidget extends StatefulWidget {
  final double size; // kích thước hành tinh
  final double radiusX; // bán kính quỹ đạo ngang
  final double radiusY; // bán kính quỹ đạo dọc
  final double centerX; // tâm quỹ đạo ngang
  final double centerY; // tâm quỹ đạo dọc
  final double rotationAmplitude; // góc xoay tối đa
  final Duration duration; // thời gian quay 1 vòng
  final String lottiePath;

  const PlanetWidget({
    super.key,
    this.size = 100,
    this.radiusX = 100,
    this.radiusY = 40,
    this.centerX = 200,
    this.centerY = 200,
    this.rotationAmplitude = 0.4,
    this.duration = const Duration(seconds: 25),
    this.lottiePath = "assets/lotties/PlanetOrbit.json",
  });

  @override
  State<PlanetWidget> createState() => _PlanetWidgetState();
}

class _PlanetWidgetState extends State<PlanetWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final t = _controller.value;

        // Tính vị trí theo quỹ đạo elip
        final dx = widget.centerX + cos(t * 2 * pi) * widget.radiusX;
        final dy = widget.centerY + sin(t * 2 * pi) * widget.radiusY;

        // Tính góc xoay nhẹ theo quỹ đạo
        final angle =
            -widget.rotationAmplitude / 2 +
            sin(t * 2 * pi) * widget.rotationAmplitude;

        return Positioned(
          left: dx - widget.size / 2,
          top: dy - widget.size / 2,
          child: Transform.rotate(
            angle: angle,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: Lottie.asset(widget.lottiePath, repeat: true),
            ),
          ),
        );
      },
    );
  }
}
