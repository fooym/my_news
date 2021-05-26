import 'package:flutter/material.dart';
import 'package:my_news/common/apis/apis.dart';
import 'package:my_news/common/entitys/entitys.dart';
import 'package:my_news/common/utils/utils.dart';
import 'package:my_news/pages/main/categories_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道

  String _selCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories();
    _channels = await NewsAPI.channels();
    _newsRecommend = await NewsAPI.newsRecommend();
    _newsPageList = await NewsAPI.newsPageList();

    _selCategoryCode = _categories.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return newsCategoriesWidget(
      categories: _categories,
      selCategoryCode: _selCategoryCode,
      onTap: (CategoryResponseEntity item) {
        setState(() {
          _selCategoryCode = item.code;
        });
      },
    );
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return Container(
      height: duSetHeight(490),
      color: Colors.amber,
    );
  }

  // 频道
  Widget _buildChannels() {
    return Container(
      height: duSetHeight(137),
      color: Colors.blueAccent,
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Container(
      height: duSetHeight(161 * 5 + 100.0),
      color: Colors.purple,
    );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return Container(
      height: duSetHeight(259),
      color: Colors.brown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCategories(),
          _buildRecommend(),
          _buildChannels(),
          _buildNewsList(),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
