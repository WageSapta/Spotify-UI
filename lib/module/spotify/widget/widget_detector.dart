import 'package:vibration/vibration.dart';
import 'package:flutter/material.dart';

class WidgetDetector extends StatefulWidget {
  final Widget child;
  // final bool isList;
  // final int? index;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final Color? color;
  final bool isVibration;
  final Function()? onTap;
  final Function()? onLongPress;
  final Widget? goTo;
  const WidgetDetector({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.child,
    // this.isList = false,
    // this.index,
    this.goTo,
    this.margin,
    this.isVibration = false,
    this.padding,
    this.color = Colors.transparent, this.height, this.width,
  });

  @override
  State<WidgetDetector> createState() => _WidgetDetectorState();
}

class _WidgetDetectorState extends State<WidgetDetector> {
  // Set<int> listPressed = <int>{};
  // bool isPressed = false;

  // void _handlePress(index) {
  //   setState(() {
  //     if (widget.isList) {
  //       listPressed.add(index);
  //     }
  //     isPressed = true;
  //   });
  // }

  // void _handleRelease(index) {
  //   setState(() {
  //     if (widget.isList) {
  //       listPressed.remove(index);
  //     }
  //     isPressed = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onLongPressStart: (_) {
        if (widget.isVibration) {
          Vibration.vibrate(duration: 50);
        }
      },
      // onTapDown: (_) => _handlePress(widget.index),
      // onTapUp: (_) => _handleRelease(widget.index),
      // onTapCancel: () => _handleRelease(widget.index),
      // onLongPressDown: (_) => _handlePress(widget.index),
      // onLongPressUp: () => _handleRelease(widget.index),
      // onLongPressCancel: () => _handleRelease(widget.index),
      // onVerticalDragUpdate: (_)=>_handleRelease(widget.index),

      // child: Transform.scale(
      //   scale: widget.isList
      //       ? listPressed.contains(widget.index)
      //           ? 0.98
      //           : 1
      //       : isPressed
      //           ? 0.98
      //           : 1,
      //   child: ,
      // ),
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: widget.margin,
        padding: widget.padding,
        color: widget.color,
        child: widget.child,
      ),
    );
  }
}
