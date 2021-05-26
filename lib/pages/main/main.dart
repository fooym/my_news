import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_news/common/apis/apis.dart';
import 'package:my_news/common/entitys/entitys.dart';
import 'package:my_news/common/utils/utils.dart';
import 'package:my_news/pages/main/categories_widget.dart';
import 'package:my_news/pages/main/channels_widget.dart';
import 'package:my_news/pages/main/news_item_widget.dart';
import 'package:my_news/pages/main/recommend_widget.dart';

import 'newsletter_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  EasyRefreshController _controller; // EasyRefresh控制器

  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道

  String _selCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories();
    _channels = await NewsAPI.channels();
    _newsRecommend = await NewsAPI.newsRecommend();
    print(_newsRecommend);
    _newsPageList = await NewsAPI.newsPageList();

    _selCategoryCode = _categories.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return _categories == null
    ? Container() : newsCategoriesWidget(
      categories: _categories,
      selCategoryCode: _selCategoryCode,
      onTap: (CategoryResponseEntity item) {
        _loadNewsData(item.code);
      },
    );
  }

  // 拉取推荐、新闻
  _loadNewsData(
      categoryCode, {
        bool refresh = false,
      }) async {
    _selCategoryCode = categoryCode;
    _newsRecommend = await NewsAPI.newsRecommend(
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );

    if (mounted) {
      setState(() {});
    }
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommend == null
        ? Container() : recommendWidget(_newsRecommend);
  }

  // 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChannelsWidget(
      channels: _channels,
      onTap: (ChannelResponseEntity item) {},
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
      height: duSetHeight(161 * 5 + 100.0),
    )
        : Column(
      children: _newsPageList.items.map((item) {
        return Column(
          children: <Widget>[
            newsItem(item),
            Divider(height: 1),
          ],
        );
      }).toList(),
    );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return newsletterWidget();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      enableControlFinishLoad: true,
      controller: _controller,
      header: ClassicalHeader(),
      onRefresh: () async {
        await _loadNewsData(_selCategoryCode, refresh: true,);
        _controller.finishRefresh();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildCategories(),
            Divider(height: 1),
            _buildRecommend(),
            Divider(height: 1),
            _buildChannels(),
            Divider(height: 1),
            _buildNewsList(),
            Divider(height: 1),
            _buildEmailSubscribe(),
          ],
        ),
      ),
    );
  }
}
