import 'package:flutter/material.dart';

import '../colors.dart';

const LinearGradient buttonLinearGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: <Color>[
    Color(0xFF4d6660),
    Color(0xFF47655d),
    Color(0xFF42655a),
    Color(0xFF3c6457),
    Color(0xFF376354),
    Color(0xFF326250),
    Color(0xFF2c614c),
    Color(0xFF286048),
    Color(0xFF235f43),
    Color(0xFF1e5e3e),
    Color(0xFF1a5c39),
    Color(0xFF165b34)
  ],
);

final ButtonStyle gradientButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
);

final ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: backgroundButton,
);
