import 'package:flutter/material.dart';

import './colors.dart';

const TextStyle mistakeSentence = TextStyle(
  // backgroundColor: customRed,
  color: customRed,
  fontSize: 24,
);

const TextStyle allSentence = TextStyle(
  backgroundColor: customBlack,
  fontSize: 20,
  overflow: TextOverflow.ellipsis,
);

const BoxDecoration suggestionDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(2.0)),
  color: customBlue,
);

// file info text style
const TextStyle fileInfoStyle = TextStyle(
  backgroundColor: customBlack,
  fontSize: 24,
  overflow: TextOverflow.ellipsis,
);
