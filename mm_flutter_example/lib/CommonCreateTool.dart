import 'package:flutter/material.dart';
import 'package:mm_flutter_example/SliverCustomPersistentHeaderDelegate.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommonCreateTool {

  static Widget createAppBar() {
    return SliverAppBar(
        title: Text('Sliver App Bar'),
        // expandedHeight: 100, //拉伸后高度。
        // stretch: true, //可拉伸
        pinned: false,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('FlexibleSpaceBar Title'),
          background: Container(
            color: Colors.pink,
              child:
          Column(
            children: [
              Text('data'),
              FlutterLogo(size: 50,),
            ],
          ))
          ),
          // collapseMode: CollapseMode.none,
          // stretchModes: [
          //   //拉伸模式
          //   StretchMode.blurBackground,
          //   StretchMode.fadeTitle
          // ],

        // )
    );
  }

  static Widget createHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverCustomPersistentHeaderDelegate(
          minHeight: 60,
        maxHeight: 60,
        child: Row(
          children: [
            Text('Header text 1'),
            Text('Header text 2'),
            Container(
              height: 20,
              color: Colors.red[200]
            )
          ],
        )
      ),
    );
  }

  static Widget createFooter() {
    return ClassicFooter(
        height: 60,
    loadingText: "加载中",
    noDataText: "无网络，请联网查看相关数据",
    failedText: "请求失败",
    idleText: "已展示句子收藏",
    canLoadingText: "上拉加载更多",
    );
  }

  static Widget createRefreshHeader() {
    return ClassicHeader(
      idleText: "下拉同步句子收藏sdfds",
      releaseText: "松开同步句子收藏",
      refreshingText: "句子收藏同步中",
      completeText: "已同步为最新",
      failedText: "同步失败，请重试",
      canTwoLevelText: '二楼打开提示',
      canTwoLevelIcon: FlutterLogo(),
      idleIcon: FlutterLogo(),
      releaseIcon: FlutterLogo(),
      refreshingIcon: FlutterLogo(),
      failedIcon: FlutterLogo(),
      completeIcon: FlutterLogo(),
    );
  }
}