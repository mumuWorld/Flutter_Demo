import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NestedScrollExample extends StatefulWidget {
  const NestedScrollExample({Key? key}) : super(key: key);

  @override
  State<NestedScrollExample> createState() => _NestedScrollExampleState();
}

class _NestedScrollExampleState extends State<NestedScrollExample> {
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    // _listController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        body: SmartRefresher(
          controller: _refreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: () {
            dropdownRefreshData();
          },
          header: ClassicHeader(
            idleText: "下拉同步句子收藏",
            releaseText: "松开同步句子收藏",
            refreshingText: "句子收藏同步中",
            completeText: "已同步为最新",
            failedText: "同步失败，请重试",
            idleIcon: FlutterLogo(),
            releaseIcon: FlutterLogo(),
            refreshingIcon: FlutterLogo(),
            failedIcon: FlutterLogo(),
            completeIcon: FlutterLogo(),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            // physics: const ClampingScrollPhysics(), //重要
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 50,
                child: Center(child: Text('Item $index')),
              );
            },
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // 返回一个 Sliver 数组给外部可滚动组件。
          return <Widget>[
            SliverAppBar(
              title: const Text('嵌套ListView'),
              pinned: true, // 固定在顶部
              forceElevated: innerBoxIsScrolled,
            ),
            buildSliverList(5), //构建一个 sliverList
          ];
        },
      ),
    );
  }

  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return ListTile(title: Text('$index'));
        },
        childCount: count,
      ),
    );
  }

  void dropdownRefreshData() {
    // try {
    // isRefreshing = true;
    // if (curPage <= 0) {
      //     YDWBSentencePlayerManager.sharedInstance.stop();
      //     await refreshData();
    // } else {
      //     await fetchData(pageNum: pageNum);
    // }
    Future.delayed(Duration(seconds: 2), () {
      _refreshController.refreshCompleted();
    });
    // } catch (e) {
    //   pullDownRefreshController.refreshFailed();
    //   YDToast.newShow("无网络，请联网后查看相关内容");
    // } finally {
    //   isRefreshing = false;
    // }

  }
}
