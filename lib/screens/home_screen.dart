import 'package:flutter/material.dart';
import 'package:intern10/app_style.dart';
import 'package:intern10/components/news_list_tile.dart';
import 'package:intern10/components/slider.dart';
import 'package:intern10/models/article_model.dart';
import 'package:intern10/providers/headline_provider.dart';
import 'package:intern10/providers/more_news_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() {
    context.read<HeadlineProvider>().getNews();
    context.read<MoreNewsProvider>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    List<ArticleModel> listOfNewsTile =
        context.watch<MoreNewsProvider>().headline;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fw",
              style: AppStyle.appBarTitleText,
            ),
            Text(
              "News",
              style: AppStyle.appBarTitle,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Top Headlines", style: AppStyle.h1Text),
            ),
            const SizedBox(
              height: 20,
            ),
            const NewsSlider(),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("More News", style: AppStyle.h1Text),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Column(
              children: listOfNewsTile.map((e) => NewsListTile(e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
