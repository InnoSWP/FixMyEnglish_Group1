import 'package:flutter/material.dart';

import '../constants/constants.dart';

AppBar getAppBar({
  backgroundColor = const Color(0xFF4D6658),
  title,
  elevation = 0,
}) {
  title ??= getLogo();
  return AppBar(
    elevation: elevation,
    backgroundColor: backgroundColor,
    title: title,
  );
}

Widget getLogo({
  width = 200,
  image,
}) {
  image ??= getImage(
    message: 'trying to get Logo',
    path: logoPath,
    width: width,
  );
  return Container(
    alignment: Alignment.center,
    child: image,
  );
}

Image getImage({
  message,
  required path,
  width,
}) {
  return Image(
    image: AssetImage(path),
    color: Colors.white,
    width: width,
    errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) =>
            Text('error: [$message] not found!'),
  );
}
