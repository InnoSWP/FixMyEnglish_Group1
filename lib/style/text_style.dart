import 'package:flutter/material.dart';

import './colors.dart';

/// [TextStyle] for mistake phrases in MistakeList.
const TextStyle mistakeSentence = TextStyle(
  color: customRed,
  fontSize: 20,
  overflow: TextOverflow.visible,
);

/// [TextStyle] for all sentences in MistakeList except error phrases.
const TextStyle allSentence = TextStyle(
  color: customBlack,
  fontSize: 20,
  overflow: TextOverflow.visible,
);

/// [TextStyle] for mistake phrases in report a bug box.
const TextStyle smallMistakeSentence = TextStyle(
  color: customRed,
  fontSize: 16,
  overflow: TextOverflow.visible,
);

/// [TextStyle] for all sentences in report a bux box except error phrases.
const TextStyle smallAllSentence = TextStyle(
  color: customBlack,
  fontSize: 16,
  overflow: TextOverflow.visible,
);

/// [TextStyle] for displaying some information about a file. e.g file name
const TextStyle fileInfoStyle = TextStyle(
  color: customBlack,
  fontSize: 24,
  overflow: TextOverflow.ellipsis,
);

/// [TextStyle] for text in extract buttons.
const TextStyle extractButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontFamily: 'Eczar',
);

/// [TextStyle] for a message in Toasts.
const TextStyle toastTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.black,
  overflow: TextOverflow.ellipsis,
);
