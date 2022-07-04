import 'package:fix_my_english/style/decorations.dart';
import 'package:flutter/material.dart';

import '../style/text_style.dart';

enum ToastType {
  info,
  warning,
  error,
}

class CustomToast extends StatelessWidget {
  const CustomToast({
    super.key,
    required this.msg,
    this.type = ToastType.info,
  });

  final ToastType type;
  final String msg;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ToastType.info:
        return _buildInfoType(context);
      case ToastType.warning:
        return _buildWarningType(context);
      case ToastType.error:
        return _buildErrorType(context);
      default:
        return const Center(
          child: Text('Toast type not found!'),
        );
    }
  }

  Widget _buildInfoType(BuildContext context) {
    return Container(
      height: 50,
      width: 320,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: infoBoxReport,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/info_icon_report.png",
              height: 30, width: 30),
          const SizedBox(width: 10),
          Text(msg, style: successToast),
        ],
      ),
    );
  }

  Widget _buildWarningType(BuildContext context) {
    return Container(
      height: 50,
      width: 320,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: warningBoxReport,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/warning_icon_report.png",
              height: 30, width: 30),
          const SizedBox(width: 10),
          Text(msg, style: warningToast),
        ],
      ),
    );
  }

  Widget _buildErrorType(BuildContext context) {
    return Container(
      height: 50,
      width: 320,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: errorBoxReport,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/error_icon_report.png", height: 30, width: 30),
          const SizedBox(width: 10),
          Text(msg, style: errorToast),
        ],
      ),
    );
  }
}
