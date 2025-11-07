import 'package:flutter/material.dart';
import 'package:my_learning_app/utils/galaxy_pink_theme.dart';
import 'dart:ui';

class GlassBox extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;

  const GlassBox({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.padding = const EdgeInsets.all(12),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: GalaxyPinkTheme.glassDecoration(),
          child: child,
        ),
      ),
    );
  }
}
