// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class ResizeWidgetDetector extends StatefulWidget {
  final Widget child;
  final bool isList;
  final int? index;
  final EdgeInsets? margin;
  final bool isVibration;
  final Function()? onTap;
  final Function()? onLongPress;
  final Widget? goTo;
  const ResizeWidgetDetector({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.isList = false,
    this.index,
    this.goTo,
    this.margin,
    this.isVibration = false,
  }) : assert(
            isList == true && index != null || isList == false && index == null,
            "Harus ada isList dan index");

  @override
  State<ResizeWidgetDetector> createState() => _ResizeWidgetDetectorState();
}

class _ResizeWidgetDetectorState extends State<ResizeWidgetDetector> {
  Set<int> listPressed = <int>{};
  bool isPressed = false;

  void _handlePress(index) {
    setState(() {
      if (widget.isList && index != null) {
        listPressed.add(index);
      }
      isPressed = true;
    });
  }

  void _handleRelease(index) {
    setState(() {
      if (widget.isList && index != null) {
        listPressed.remove(index);
      }
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _handlePress(widget.index),
      onTapUp: (_) => _handleRelease(widget.index),
      onTapCancel: () => _handleRelease(widget.index),
      onLongPress: widget.onLongPress,
      onLongPressDown: (_) => _handlePress(widget.index),
      onLongPressStart: (_) {
        if (widget.isVibration) {
          Vibration.vibrate(duration: 50);
        }
        _handlePress(widget.index);
      },
      onLongPressUp: () => _handleRelease(widget.index),
      onLongPressCancel: () => _handleRelease(widget.index),
      child: Transform.scale(
        scale: widget.isList
            ? listPressed.contains(widget.index)
                ? 0.98
                : 1
            : isPressed
                ? 0.98
                : 1,
        child: Container(margin: widget.margin, child: widget.child),
      ),
    );
  }
}
