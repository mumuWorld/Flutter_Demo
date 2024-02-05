// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// mixin BlinkingMixin on StatefulWidget {
//   Timer? _timer;
//   bool _visible = true;
//   Duration get blinkDuration => Duration(milliseconds: 500);
//   bool get initialState => true;
//
//   @override
//   State<StatefulWidget> createState() => _BlinkingMixinState();
// }
//
// class _BlinkingMixinState<T extends BlinkingMixin> extends State<T> {
//   @override
//   void initState() {
//     super.initState();
//     widget._timer = Timer.periodic(widget.blinkDuration, (Timer timer) {
//       if (mounted) {
//         setState(() {
//           widget._visible = !widget._visible;
//         });
//       }
//     });
//     widget._visible = widget.initialState;
//   }
//
//   @override
//   void dispose() {
//     widget._timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: widget._visible,
//       child: super.build(context),
//     );
//   }
// }
//
// class MyBlinkingWidget extends StatefulWidget with BlinkingMixin {
//   final Color color;
//
//   MyBlinkingWidget({this.color = Colors.blue});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       color: color,
//       child: Text('Blinking'),
//     );
//   }
// }