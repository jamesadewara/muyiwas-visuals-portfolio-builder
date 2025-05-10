import 'package:flutter/material.dart';
import 'package:muyiwas_visuals_portfolio_builder/config/app_config.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Gradient? gradient;
  final double borderRadius;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.gradient,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient ??
            LinearGradient(
              colors: [
                Color(int.parse(AppConfig.primaryColor.substring(1, 7), radix: 16)),
                Color(int.parse(AppConfig.secondaryColor.substring(1, 7), radix: 16)),
              ],
            ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}