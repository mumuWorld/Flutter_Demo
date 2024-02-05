import 'package:flutter/material.dart';

/*单词本上次浏览记录提示*/
class YDWBLastWordTipManager {
  OverlayEntry? _entry;
  //当前展示的屏幕方向: 改变方向后需要隐藏
  Orientation? curOrientation;
  //标志位：每次出现只展示一次
  bool hadShow = false;

  void showLastWord(BuildContext context, double topOffset, double rightOffset) {
    OverlayEntry entry = OverlayEntry(builder: (c) {
      return YDWBLastWordTipWidget(baseBuildContext: context, topOffset: topOffset, rightOffset: rightOffset);
    });
    _entry = entry;
    Overlay.of(context)?.insert(entry);
    Future.delayed(Duration(seconds: 5), () {
      dismissTip();
    });
  }

  void dismissTip() {
    _entry?.remove();
    _entry = null;
    curOrientation = null;
  }
}

class YDWBLastWordTipWidget extends StatefulWidget {
  final BuildContext baseBuildContext;  //需要根据上下文使用颜色
  final double topOffset;
  final double rightOffset;
  const YDWBLastWordTipWidget({Key? key, required this.baseBuildContext, required this.topOffset,required this.rightOffset}) : super(key: key);

  @override
  State<YDWBLastWordTipWidget> createState() => _YDWBLastWordTipWidgetState();
}

class _YDWBLastWordTipWidgetState extends State<YDWBLastWordTipWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurveTween(curve: Curves.easeInOut)
            .animate(animationController));
    Future.delayed(Duration(milliseconds: 500), () {
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: AlignmentDirectional.topEnd,
            margin: EdgeInsets.only(
                top: widget.topOffset,
                right: widget.rightOffset),
            padding: EdgeInsets.only(left: 12, right: 8, top: 2),
            height: 22,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(11),
                    bottomLeft: Radius.circular(11)),
                color: Colors.cyan.withOpacity(0.5)),
            child: Text(
              "已定位到上次浏览位置 ${MediaQuery.of(context).padding.top}",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            )),
      ],
    );
  }
}
