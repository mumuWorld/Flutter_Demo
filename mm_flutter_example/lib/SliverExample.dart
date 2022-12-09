import 'package:flutter/material.dart';
import 'package:mm_flutter_example/CommonCreateTool.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SliverExample extends StatefulWidget {
  const SliverExample({Key? key}) : super(key: key);

  @override
  State<SliverExample> createState() => _SliverExampleState();
}

class _SliverExampleState extends State<SliverExample>
    with SingleTickerProviderStateMixin {
  late RefreshController _refreshController;
  late RefreshController _refreshController2;
  late ScrollController _listController;
  late TabController _tabController;
  late ScrollController _mainScrollController;

  int curPage = 0;

  bool isRefreshing = false;

  @override
  void initState() {
    _refreshController = RefreshController();
    _refreshController2 = RefreshController();
    _listController = ScrollController();
    _mainScrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _refreshController2.dispose();
    _listController.dispose();
    _tabController.dispose();
    _mainScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // //从父类查找类型
    // context.dependOnInheritedWidgetOfExactType();
    // //找到父类的state
    // (context as Element).findAncestorStateOfType();
    return Scaffold(
      body: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        enablePullDown: true,
        onRefresh: () {
          dropdownRefreshData(_refreshController);
        },
        onLoading: () {
          loadmore(_refreshController);
        },
        header: CommonCreateTool.createRefreshHeader(),
        child: CustomScrollView(
          controller: _mainScrollController,
          physics: ClampingScrollPhysics(),
          slivers: [
            CommonCreateTool.createAppBar(),
            CommonCreateTool.createHeader(),
            // SliverToBoxAdapter(
            //   child: Placeholder(),
            // ),
            SliverList(
              delegate: SliverChildListDelegate([
                FlutterLogo(
                  size: 100,
                ),
              ])),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                createRefreshList(),  //嵌套的scroll
                ListView.builder(
                    itemCount: 30,
                    controller: _listController,
                    // physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: 30, child: Text('这个index -> $index'));
                    }),
              ],
            ),
          ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          int nextIndex = _tabController.index == 1 ? 0 : 1;
          _tabController.index = nextIndex;
        },
        child: const Icon(Icons.cameraswitch),
      ),
    );
  }

  Widget createRefreshList() {
    return NotificationListener(
      onNotification: (event) {
        return true;
      },
      child: SmartRefresher(
        controller: _refreshController2,
        enablePullUp: true,
        enablePullDown: true,
        onRefresh: () {
          dropdownRefreshData(_refreshController2);
        },
        onLoading: () {
          loadmore(_refreshController2);
        },
        header: CommonCreateTool.createRefreshHeader(),
        footer: CommonCreateTool.createFooter(),
        child: ListView.builder(
            itemCount: 30,
            controller: _listController,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(height: 30, child: Text('这个index -> $index'));
            }),
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

  void loadmore(RefreshController controller) {
    Future.delayed(Duration(seconds: 2),() {
      controller.loadComplete();
    });
  }

  void dropdownRefreshData(RefreshController controller) {
    // try {
    isRefreshing = true;
    if (curPage <= 0) {
      //     YDWBSentencePlayerManager.sharedInstance.stop();
      //     await refreshData();
    } else {
      //     await fetchData(pageNum: pageNum);
    }
    Future.delayed(Duration(seconds: 2), () {
      controller.refreshCompleted();
    });
    // } catch (e) {
    //   pullDownRefreshController.refreshFailed();
    //   YDToast.newShow("无网络，请联网后查看相关内容");
    // } finally {
    //   isRefreshing = false;
    // }
  }
}
