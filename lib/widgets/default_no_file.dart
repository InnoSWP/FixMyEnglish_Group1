import 'package:flutter/material.dart';

/// A widget to show when no file imported or all files are deleted.
///
/// This widget has a button that you can click and add new files
class DefaultNoFile extends StatelessWidget {
  /// Provide a [VoidCallback] function when 'add pdf' button clicked.
  final VoidCallback onPressed;
  const DefaultNoFile({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Image.asset("assets/icons/default_no_file.png"),
      ),
    );
  }
}
