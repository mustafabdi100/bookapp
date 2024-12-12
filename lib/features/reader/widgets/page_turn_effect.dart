// lib/features/reader/widgets/page_turn_effect.dart

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PageTurnWidget extends StatelessWidget {
  final Widget child;
  final double dragValue;
  final bool isForward;
  final bool showCurvedShadow;

  const PageTurnWidget({
    super.key,
    required this.child,
    required this.dragValue,
    this.isForward = true,
    this.showCurvedShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main page content
        Transform(
          alignment: isForward ? Alignment.centerRight : Alignment.centerLeft,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(isForward ? -dragValue * math.pi : dragValue * math.pi),
          child: child,
        ),
        // Curved shadow
        if (showCurvedShadow && dragValue != 0)
          Positioned(
            top: 0,
            bottom: 0,
            right: isForward ? 0 : null,
            left: isForward ? null : 0,
            child: CustomPaint(
              size: Size(40 * dragValue.abs(), double.infinity),
              painter: _CurvedShadowPainter(
                isForward: isForward,
                intensity: dragValue.abs(),
              ),
            ),
          ),
      ],
    );
  }
}

class _CurvedShadowPainter extends CustomPainter {
  final bool isForward;
  final double intensity;

  _CurvedShadowPainter({
    required this.isForward,
    required this.intensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: isForward ? Alignment.centerRight : Alignment.centerLeft,
        end: isForward ? Alignment.centerLeft : Alignment.centerRight,
        colors: [
          Colors.black.withOpacity(0.4 * intensity),
          Colors.black.withOpacity(0.0),
        ],
      ).createShader(Offset.zero & size);

    final path = Path()
      ..moveTo(isForward ? size.width : 0, 0)
      ..quadraticBezierTo(
        isForward ? 0 : size.width,
        size.height / 2,
        isForward ? size.width : 0,
        size.height,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CurvedShadowPainter oldDelegate) {
    return oldDelegate.intensity != intensity ||
        oldDelegate.isForward != isForward;
  }
}
