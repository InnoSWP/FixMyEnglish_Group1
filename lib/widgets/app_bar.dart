import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../style/colors.dart';
import './bulk_upload.dart';

AppBar getAppBar({
  backgroundColor = appBarBackground,
  title,
  elevation = 0,
  actions = false,
  logoWidth = 200,
}) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    elevation: elevation,
    backgroundColor: backgroundColor,
    title: Container(
      alignment: Alignment.topLeft,
      child: Image(
        image: const AssetImage(logoPath),
        color: appBarIconBackground,
        width: logoWidth,
      ),
    ),
    actions: (actions ? [const BulkUploadButton()] : null),
  );
}
