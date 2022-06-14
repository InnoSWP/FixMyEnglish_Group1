import 'package:flutter/material.dart';

import './colors.dart';

// my style of ElevatedButton
final ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
  primary: colorSecondaryGreenPlant,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

// ButtonStyle getMyButtonStyle() {
//   return ElevatedButton.styleFrom(
//     primary: buttonBackgroundColor,
//     minimumSize: const Size(88, 36),
//     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(2.0)),
//     ),
//   );
// }
