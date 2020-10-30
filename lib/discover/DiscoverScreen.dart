import 'dart:convert';
import 'package:flutter/material.dart';

import 'Company.dart';
import 'CompanyItem.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

// 原来还可以这么玩
class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int _page = 1;
  List<Company> _dataList = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getDataList();
  }

  getDataList() async {
    String url = 'http://m.app.haosou.com/index/getData?type=1&page=1';
    var response = await http.get(url);
    var data = response.body;
    var json = jsonDecode(data);
    setState(() {
      if (_page == 1) {
        _dataList = Company.fromMapData(json);
        _refreshController.refreshCompleted();
      } else {
        _dataList.addAll(Company.fromMapData(json));
        _refreshController.loadComplete();
      }
    });
  }

  Widget _buildContent(context) {
    if (_dataList.isEmpty) {
      return new Center(
        child: CircularProgressIndicator(),
      );
    }

    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: ClassicHeader(
          refreshingText: '正在加载中...',
          idleText: '下拉刷新',
          completeText: '加载完成',
          failedText: '数据刷新异常',
          releaseText: '松开刷新'),
      footer: ClassicFooter(
          idleText: '加载更多数据', loadingText: '玩命加载中...', noDataText: '没有更多数据'),
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemBuilder: (context, index) {
          var model = _dataList[index];
          return InkWell(
            child: CompanyItem(model),
            onTap: () {},
          );
        },
        itemCount: _dataList.length,
      ),
    );
  }

  void _onRefresh() {
    _page = 1;
    getDataList();
  }

  void _onLoading() {
    _page++;
    getDataList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('发现'),
        ),
        body: _buildContent(context));
  }
}
