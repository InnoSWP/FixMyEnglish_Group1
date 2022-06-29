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
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final BoxBorder? border;
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
    this.padding,
    this.margin,
    this.alignment,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: gradient,
        color: color,
        border: border,
      ),
      child: ElevatedButton(
        style: style ?? gradientButtonStyle,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
