import 'package:fix_my_english/style/decorations.dart';
import 'package:flutter/material.dart';

import '../style/text_style.dart';

/// Types of [CustomToast] widget
enum ToastType {
  /// First, type of [CustomToast] that shows content as some information.
  ///
  /// INFO type of [CustomToast] is a widget with info icon and [infoBoxReport] box decoration.
  /// This type is used when you want to display some information to user.
  info,

  /// Second, type of [CustomToast] that shows content as some warning message.
  ///
  /// Warning type of [CustomToast] is a widget with warning icon and [warningBoxReport] box decoration.
  /// This type is used when you want to show some warning to user.
  warning,

  /// Third, type of [CustomToast] that shows content as some error message.
  ///
  /// Error type of [CustomToast] is a widget with error icon and [errorBoxReport] box decoration.
  /// This type is used when you want to show some error to user.
  error,
}

/// A widget to show some message to user.
///
/// Messages depends on type of [CustomToast] by default its [ToastType.info]
/// Depending to types this widget can show your message as Info, Warning, Error
class CustomToast extends StatelessWidget {
  const CustomToast({
    super.key,
    required this.msg,
    this.type = ToastType.info,
  });

  /// Type of [CustomToast] by default its [ToastType.info]
  final ToastType type;

  /// Message you want to display to user
  ///
  /// All styles depends on chosen [ToastType]
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

  /// Build Info type of [CustomToast]
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
          Text(msg, style: toastTextStyle),
        ],
      ),
    );
  }

  /// Build Warning type of [CustomToast]
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
          Text(msg, style: toastTextStyle),
        ],
      ),
    );
  }

  /// Build Error type of [CustomToast]
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
          Image.asset("assets/icons/error_icon_report.png",
              height: 30, width: 30),
          const SizedBox(width: 10),
          Text(msg, style: toastTextStyle),
        ],
      ),
    );
  }
}
