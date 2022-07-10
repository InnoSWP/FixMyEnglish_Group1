import 'package:flutter/material.dart';

/// A widget that shows animated loading image.
///
/// This Widget creates [Container] with some decorations
/// and on top of it displays a animated loading image
class CustomLoading extends StatefulWidget {
  const CustomLoading({super.key});

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 120,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        RotationTransition(
          alignment: Alignment.center,
          turns: Tween(begin: 1.0, end: 0.0).animate(_controller),
          child: Image.asset(
            "assets/icons/loading.png",
            height: 70,
            width: 70,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: const Text('loading...'),
        ),
      ]),
    );
  }
}
