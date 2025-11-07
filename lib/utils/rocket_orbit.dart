import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lottie/lottie.dart';

class RocketOrbit extends StatefulWidget {
  const RocketOrbit({super.key});

  @override
  State<RocketOrbit> createState() => _RocketOrbitState();
}

class _RocketOrbitState extends State<RocketOrbit>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final t = _controller.value;

        // đường bay nằm giữa màn hình
        final dx = size.width * 0.2 + sin(t * 2 * pi) * size.width * 0.45;
        final dy =
            size.height * 0.35 + cos(t * 2 * pi) * 150; // dao động nhẹ dọc

        // xoay tàu
        final angle = -0.2 + sin(t * 2 * pi) * 0.4;

        return Positioned(
          left: dx,
          top: dy,
          child: Transform.rotate(
            angle: angle,
            child: SizedBox(
              width: 100,
              child: Lottie.asset("assets/lotties/rocket.json", repeat: true),
            ),
          ),
        );
      },
    );
  }
}
