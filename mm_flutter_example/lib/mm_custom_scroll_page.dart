import 'package:flutter/material.dart';
import 'package:mm_flutter_example/Base/MMBaseState.dart';
import 'package:mm_flutter_example/mm_label_cell.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MMCustomScrollPage extends StatefulWidget {
  const MMCustomScrollPage({Key? key}) : super(key: key);

  @override
  State<MMCustomScrollPage> createState() => _MMCustomScrollPageState();
}

class _MMCustomScrollPageState extends MMBaseState<MMCustomScrollPage> {

  late MMMainSliverDelegate delegate = MMMainSliverDelegate(context);

  late AutoScrollController controller;

  @override
  String get barTitle {
    return "开发工具合集";
  }

  @override
    void initState() {
      super.initState();
      controller = AutoScrollController();
      // controller = AutoScrollController(
      //     viewportBoundaryGetter: () =>
      //         Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      //     axis: Axis.vertical);
      // randomList = List.generate(1000,
              // (index) => <int>[index, (maxHeight * random.nextDouble()).toInt()]);
    }

  @override
  Widget? get floatingActionButton {
    return FloatingActionButton(
      onPressed: (){
        scrollToIndex();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  void scrollToIndex() {
    controller.scrollToIndex(1000, duration: const Duration(milliseconds: 1000));
  }

  @override
  Widget getBody(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return AutoScrollTag(
                key: ValueKey(index),
                  index: index,
                  controller: controller,
                  child: delegate.build(context, index));
            }, childCount: 10000))
      ],
    );
  }
}


class MMMainSliverDelegate {

  late var dataList = [
    "String 操作"
  ];
  //正常情况不会变，除非使用 GlobalKey这种。
  BuildContext context;

  MMMainSliverDelegate(this.context);

  void handleClickCallBack(int index) {
    print("点击->$index");
    if (index == 0) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   // return const MMStrToolPage();
      // }));
    }
  }

  Widget? build(BuildContext context, int index) {
    // var item = dataList[index];
    var item = "当前index：$index";
    return MMMainLabelCell(
      title: item,
      callback: () {
        handleClickCallBack(index);
      },
    );
  }

}