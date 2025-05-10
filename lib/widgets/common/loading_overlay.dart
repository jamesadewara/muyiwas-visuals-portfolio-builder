import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color? overlayColor;
  final double opacity;
  final Widget? progressIndicator;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.overlayColor,
    this.opacity = 0.5,
    this.progressIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) ...[
          ModalBarrier(
            dismissible: false,
            color: (overlayColor ?? Colors.black).withOpacity(opacity),
          ),
          Center(
            child: progressIndicator ?? const CircularProgressIndicator(),
          ),
        ],
      ],
    );
  }
}