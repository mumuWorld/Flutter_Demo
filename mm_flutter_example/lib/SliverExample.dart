import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SliverExample extends StatefulWidget {
  const SliverExample({Key? key}) : super(key: key);

  @override
  State<SliverExample> createState() => _SliverExampleState();
}

class _SliverExampleState extends State<SliverExample> with SingleTickerProviderStateMixin {
  late RefreshController _refreshController;
  late ScrollController _listController;
  late TabController _tabController;

  int curPage = 0;

  bool isRefreshing = false;

  @override
  void initState() {
    _refreshController = RefreshController();
    _listController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _listController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // //从父类查找类型
    // context.dependOnInheritedWidgetOfExactType();
    // //找到父类的state
    // (context as Element).findAncestorStateOfType();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Sliver App Bar'),
            expandedHeight: 100, //拉伸后高度。
            stretch: true, //可拉伸
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text('FlexibleSpaceBar Title'),
              collapseMode: CollapseMode.none,
              stretchModes: [
                //拉伸模式
                StretchMode.blurBackground,
                StretchMode.fadeTitle
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Placeholder(),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            FlutterLogo(
              size: 50,
            ),
            FlutterLogo(
              size: 100,
            ),
            FlutterLogo(
              size: 150,
            )
          ])),
          SliverFillRemaining(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notify) {
                print('test-> ${notify.metrics.pixels}');
                return true;
              },
              child: TabBarView(
                controller: _tabController,
                  children: [
                    NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        // 返回一个 Sliver 数组给外部可滚动组件。
                        return <Widget>[
                        //   SliverAppBar(
                        //     title: const Text('嵌套ListView'),
                        //     pinned: true, // 固定在顶部
                        //     forceElevated: innerBoxIsScrolled,
                        //   ),
                          buildSliverList(5), //构建一个 sliverList
                            // Container()
                        ];
                      },
                      body: createRefreshList()
                    ),
                    ListView.builder(
                        itemCount: 30,
                        controller: _listController,
                        // physics: ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 30, child: Text('这个index -> $index'));
                        }),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget createRefreshList() {
    return SmartRefresher(
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
          itemCount: 30,
          controller: _listController,
          // physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(height: 30, child: Text('这个index -> $index'));
          }),
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
    isRefreshing = true;
    if (curPage <= 0) {
      //     YDWBSentencePlayerManager.sharedInstance.stop();
      //     await refreshData();
    } else {
      //     await fetchData(pageNum: pageNum);
    }
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
