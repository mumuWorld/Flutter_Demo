import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  final Function(String) onChange;

  const TimePickerWidget({Key? key, required this.onChange}) : super(key: key);
  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {

  late Map<int, List<int>> sortedMonthMap;
  late List yearList;
  late List<int> _monthList;
  int _curYearIndex = 0;
  int _curMonthIndex = 0;

  @override
    void initState() {
      super.initState();
        sortedMonthMap = {
          2001: [1, 3,5],
          2002: [7, 9,10],
          2003: [3, 5,6],
          2004: [11, 12]
        };
        yearList = [2001,  2002, 2003, 2004];
      _monthList = sortedMonthMap[yearList[_curYearIndex]]!;

  }

  set curYearIndex(int index) {
    _curYearIndex = index;
    _monthList = sortedMonthMap[yearList[_curYearIndex]]!;
    print('test->更新月份列表: $_monthList');
    setState(() {});
  }

  Widget durationPicker({bool inMinutes = false}) {
    return CupertinoPicker(
      selectionOverlay: selectionOverlay(!inMinutes),
        itemExtent: 30, onSelectedItemChanged: (index){
      curYearIndex = index;
      monthController.animateToItem(0, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
      // monthController.jumpToItem(0);
      print('test->选中年: $index, 月: ${monthController.selectedItem}');
    }, children: List.generate(yearList.length, (index) {
      return Text(
        yearList[index].toString(),
        textAlign:TextAlign.end,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 20,
            fontWeight: FontWeight.w300
        ),
      );
    }));
    // return CupertinoPicker(
    //   scrollController: FixedExtentScrollController(initialItem: 0),
    //   // backgroundColor: Colors.red,
    //   selectionOverlay: selectionOverlay(!inMinutes),
    //   onSelectedItemChanged: (x) {
    //     if (inMinutes) {
    //       currentTimeInMin = x.toString();
    //     } else {
    //       currentTimeInHour = x.toString();
    //     }
    //     setState(() {});
    //     widget.onChange('$currentTimeInHour Hr $currentTimeInMin mins');
    //   },
    //   // diameterRatio: 1.0,   //滚桶弧度
    //   // offAxisFraction: 0.2, //轴偏离系数
    //   useMagnifier: true, //使用放大镜
    //   // magnification: 1.1, //当前选中item放大倍数
    //   children: List.generate(
    //       inMinutes ? 60 : 24,
    //           (index) => Text(inMinutes ? '$index mins' : '$index Hr',
    //           style: TextStyle(color: Colors.black))),
    //   itemExtent: 30, //行高合适的情况才会居中
    // );
  }

  // Widget selectionOverlay(bool isLeft) {
  //   return Container(
  //     color: Colors.grey.withOpacity(0.4),
  //   );
  // }
  Widget selectionOverlay(bool isLeft) {
    Radius radius = const Radius.circular(10);
    BorderRadius borderRadius = isLeft ? BorderRadius.only(topLeft: radius, bottomLeft: radius) : BorderRadius.only(topRight: radius, bottomRight: radius);
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color:  Colors.grey.withOpacity(0.4),
      ),
    );
  }

  String currentTimeInHour = '';
  String currentTimeInMin = '';
  FixedExtentScrollController monthController = FixedExtentScrollController(initialItem: 0);
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Custom Time Picker',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const Text(
              'Scroll the list to pick the time.',
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        const TextSpan(
                          text: 'Selected: ',
                        ),
                        TextSpan(
                            style: const TextStyle(color: Color(0xffe6e6ea)),
                            text:
                            '$currentTimeInHour Hr $currentTimeInMin mins'),
                        // TextSpan(text: ' $budgetinLakh Lakhs'),
                      ]),
                )),
            Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                    color: Colors.yellow,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: durationPicker()),
                        Expanded(child: CupertinoPicker(
                          scrollController: monthController,
                            selectionOverlay: selectionOverlay(false),
                            itemExtent: 30, onSelectedItemChanged: (index){
                          print('test->选中月: $index');
                        }, children: List.generate(_monthList.length, (index) {
                          return Text(
                            _monthList[index].toString(),
                            textAlign:TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w300
                            ),
                          );
                        }))),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
