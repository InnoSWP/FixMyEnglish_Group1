import 'package:flutter/material.dart';

import '../constants/constants.dart';

AppBar getAppBar({
  backgroundColor = Colors.white,
  title,
  elevation = 0,
}) {
  title ??= getLogo();
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
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
    alignment: Alignment.topLeft,
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
    color: Color(0xFF864921),
    width: width,
    errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) =>
            Text('error: [$message] not found!'),
  );
}
