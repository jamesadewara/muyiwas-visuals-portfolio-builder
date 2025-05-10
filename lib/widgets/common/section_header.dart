import 'package:flutter/material.dart';

class PortfolioSectionHeader extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;

  const PortfolioSectionHeader({
    super.key,
    required this.title,
    this.color,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}