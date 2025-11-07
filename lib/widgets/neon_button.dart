import 'package:flutter/material.dart';
import 'package:my_learning_app/utils/galaxy_pink_theme.dart';

class NeonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final List<Color>? gradient;

  const NeonButton({
    super.key,
    required this.text,
    required this.onTap,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final g =
        gradient ?? [GalaxyPinkTheme.neonPink, GalaxyPinkTheme.neonPurple];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: g),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: g.first.withOpacity(0.35),
              blurRadius: 24,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: g.last.withOpacity(0.16),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
