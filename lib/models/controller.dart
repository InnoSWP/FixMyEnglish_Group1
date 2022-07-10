import 'package:flutter/material.dart';

/// Its a simple [TextEditingController]
///
/// Usage: [TextEditingController] wrapped into a class so
/// when you pass through the parameter [MyController] you will
/// have [TextEditingController] passed by reference.
class MyController {
  MyController(this.controller);

  /// [TextEditingController] controller for [MyController].
  final TextEditingController controller;
}
