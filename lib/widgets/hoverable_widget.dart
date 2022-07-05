import 'package:flutter/material.dart';

/// A widget that gives you custom hoverable widget.
///
/// Wrap any other widget with [HoverAbleWidget] as its [child], and
/// provide [builder] that returns a widget to show it when user hovers on [child].
/// The [builder] widget will be rendered on top of any other widget using [OverlayEntry].
/// Depending on [child] position, [builder] will be placed
/// on top or left or bottom or right if its can.
///
/// See also:
///   [Tooltip] - which is provided by Flutter team. Its almost same as [HoverAbleWidget], but instead of [builder] it has only [String].
class HoverAbleWidget extends StatefulWidget {
  const HoverAbleWidget(
      {super.key, required this.child, required this.builder});

  /// Widget that need to be hoverable.
  final Widget child;

  /// On hover on [child] display widget provided by [builder].
  final Widget Function(BuildContext) builder;
  @override
  State<HoverAbleWidget> createState() => _HoverAbleWidgetState();
}

class _HoverAbleWidgetState extends State<HoverAbleWidget> {
  final _key = LabeledGlobalKey(UniqueKey().toString());
  double get _dialogHight => MediaQuery.of(context).size.height / 5;
  double get _dialogWidth => MediaQuery.of(context).size.width / 5;

  Size? _widgetSize;
  Offset? _widgetPosition;

  OverlayEntry? _overlayEntry;

  bool _ableToPlaceBottom = false;
  bool _ableToPlaceRight = false;
  bool _isDialogOpen = false;

  void _openDialog(BuildContext context) {
    findWidget();
    _overlayEntry = overlyBuilder();

    Overlay.of(context)!.insert(_overlayEntry!);

    _isDialogOpen = !_isDialogOpen;
  }

  void _closeDialog(BuildContext context) {
    _overlayEntry!.remove();

    _isDialogOpen = !_isDialogOpen;
  }

  void findWidget() {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) return;

    _widgetSize = renderBox.size;
    _widgetPosition = renderBox.localToGlobal(Offset.zero);

    _ableToPlaceBottom = _widgetPosition!.dy + _dialogHight <=
        MediaQuery.of(context).size.height;
    _ableToPlaceRight =
        _widgetPosition!.dx + _dialogWidth <= MediaQuery.of(context).size.width;
  }

  OverlayEntry? overlyBuilder() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        top: _ableToPlaceBottom
            ? _widgetPosition!.dy + _widgetSize!.height
            : null,
        left: _ableToPlaceRight ? _widgetPosition!.dx : null,
        bottom: _ableToPlaceBottom
            ? null
            : MediaQuery.of(context).size.height - _widgetPosition!.dy,
        right: _ableToPlaceRight
            ? null
            : MediaQuery.of(context).size.width -
                _widgetPosition!.dx -
                _widgetSize!.width,
        child: MouseRegion(
          onEnter: (_) {
            if (!_isDialogOpen) _openDialog(context);
          },
          onExit: (_) {
            if (_isDialogOpen) _closeDialog(context);
          },
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              height: _dialogHight,
              width: _dialogWidth,
              child: Builder(
                builder: widget.builder,
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        if (!_isDialogOpen) _openDialog(context);
      },
      onExit: (_) {
        if (_isDialogOpen) _closeDialog(context);
      },
      child: Container(
        key: _key,
        child: widget.child,
      ),
    );
  }
}
