import 'package:flutter/material.dart';

import './colors.dart';

const TextStyle mistakeSentence = TextStyle(
  color: customRed,
  fontSize: 20,
  overflow: TextOverflow.visible,
);

const TextStyle allSentence = TextStyle(
  color: customBlack,
  fontSize: 20,
  overflow: TextOverflow.visible,
);

const BoxDecoration suggestionDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(2.0)),
  color: customBlue,
);

// file info text style
const TextStyle fileInfoStyle = TextStyle(
  color: customBlack,
  fontSize: 24,
  overflow: TextOverflow.ellipsis,
);
