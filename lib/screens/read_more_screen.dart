import 'package:flutter/material.dart';
import 'package:intern10/app_style.dart';
import 'package:intern10/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class ReadMoreDetails extends StatefulWidget {
  ReadMoreDetails({required this.data, super.key});
  ArticleModel data;

  @override
  State<ReadMoreDetails> createState() => _ReadMoreDetailsState();
}

class _ReadMoreDetailsState extends State<ReadMoreDetails> {
  @override
  Widget build(BuildContext context) {
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
      body: WebView(
        initialUrl: widget.data.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
