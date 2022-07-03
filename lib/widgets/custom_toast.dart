import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  const CustomToast({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 112, 106, 106),
        borderRadius: BorderRadius.circular(100),
      ),
      child: child,
    );
  }
}
