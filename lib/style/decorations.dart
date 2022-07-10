import 'package:flutter/material.dart';

import 'colors.dart';

/// BoxDecoration for main containers in our program.
///
/// Usage:
///   Container - for MistakeList in Home Page.
///   Container - for MyTextField in Home Page.
///   Container - for MistakeList in Upload Page.
///   Container - for FileListView in Upload Page.
final BoxDecoration decorationBlocks = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ],
  color: colorTextbackgroundtextbox,
  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
  border: Border.all(color: Colors.black38),
);

/// Decoration for Toasts that have some Information.
final BoxDecoration infoBoxReport = BoxDecoration(
  color: const Color.fromARGB(255, 156, 210, 253),
  borderRadius: BorderRadius.circular(100),
);

/// Decoration for Toasts that have some Warning.
final BoxDecoration warningBoxReport = BoxDecoration(
  color: const Color.fromARGB(255, 255, 210, 143),
  borderRadius: BorderRadius.circular(100),
);

/// Decoration for Toasts that have some Error.
final BoxDecoration errorBoxReport = BoxDecoration(
  color: const Color.fromARGB(255, 255, 172, 166),
  borderRadius: BorderRadius.circular(100),
);
