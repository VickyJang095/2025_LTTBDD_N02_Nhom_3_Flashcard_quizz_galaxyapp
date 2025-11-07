import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashcardWidget extends StatelessWidget {
  final String front;
  final String back;

  const FlashcardWidget({super.key, required this.front, required this.back});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: _glassCard(front),
        back: _glassCard(back),
      ),
    );
  }

  Widget _glassCard(String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white.withOpacity(0.07),
            border: Border.all(color: Colors.white24, width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.pinkAccent.withOpacity(0.25),
                blurRadius: 30,
                spreadRadius: 3,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: Text(
                text,
                key: ValueKey(text),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  height: 1.3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
