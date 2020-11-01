import 'package:flutter/material.dart';
import 'CompanyItem.dart';
import 'package:flutter_app/provider/company_list.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

// 江湖再见
class _DiscoverScreenState extends State<DiscoverScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    provider.refreshData();
  }

  Widget _buildContent() {
    return Consumer<CompanyListProvider>(builder: (context, provider, _) {
      return IndexedStack(
        index: provider.showValue,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          SmartRefresher(
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
                idleText: '加载更多数据',
                loadingText: '玩命加载中...',
                noDataText: '没有更多数据'),
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
              itemBuilder: (context, index) {
                var model = provider.companyList[index];
                return InkWell(
                  child: CompanyItem(model),
                  onTap: () {},
                );
              },
              itemCount: provider.companyList.length,
            ),
          )
        ],
      );
    });
  }

  void _onRefresh() async {
    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    bool isSuccess = await provider.refreshData();
    if (isSuccess) {
      _refreshController.refreshCompleted();
    } else {
      _refreshController.refreshFailed();
    }
  }

  void _onLoading() async {
    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    bool isSuccess = await provider.LoadMoreData();
    if (isSuccess) {
      _refreshController.loadComplete();
    } else {
      _refreshController.loadFailed();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('发现'),
        ),
        body: _buildContent());
  }
}
