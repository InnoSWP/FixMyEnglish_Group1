import 'package:flutter/material.dart';

import '../style/fix_text_page/button_style.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;
  final ButtonStyle? style;
  final Color? color;
  const MyButton({
    super.key,
    this.onPressed,
    required this.child,
    this.width,
    this.height = 50.0,
    this.borderRadius,
    this.gradient,
    this.style,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: gradient,
        color: color,
      ),
      child: ElevatedButton(
        style: style ?? gradientButtonStyle,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
