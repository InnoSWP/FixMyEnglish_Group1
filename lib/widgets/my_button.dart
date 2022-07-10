import 'package:flutter/material.dart';

import '../style/button_style.dart';

/// A widget to diplay custom button, it's same as [ElevatedButton].
///
/// This button create good looking background for your button.
/// And also good [gradient] options for background.
/// Inside of [MyButton] can be any widget, just pass it as [child].
/// [child] widget should not exceed [height] and [width] of [MyButton].
/// To enable [MyButton] provide [onPressed] function and it should not be `null`.
class MyButton extends StatelessWidget {
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

  /// Call [onPressed] when [MyButton] clicked.
  final VoidCallback? onPressed;

  /// Width of [MyButton] in [double].
  final double? width;

  /// Height of [MyButton] in [double] by default its `50.0`.
  final double height;

  /// A widget inside the [MyButton].
  final Widget child;

  /// Border radiues for background of [MyButton].
  final BorderRadiusGeometry? borderRadius;

  /// Gradient for background of [MyButton].
  final Gradient? gradient;

  /// Style of [MyButton], if [style] not provided [style] will be [gradientButtonStyle].
  final ButtonStyle? style;

  /// Background color of [MyButton].
  final Color? color;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;

  /// Border of [MyButton] which extends [BoxBorder], used in [BoxDecoration].
  final BoxBorder? border;

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
