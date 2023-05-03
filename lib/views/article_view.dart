import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String blogUrl;
  ArticleView({required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  late final WebViewController controller;

  @override
  void initState(){
    super.initState();
    controller = WebViewController()
    ..loadRequest(Uri.parse(widget.blogUrl));
  }

  // final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lWhite,
      appBar: AppBar(
        leading: BackButton(
          color: dBlue,
        ),
        title: Text("News App", style: TextStyle(color: dBlue),),
      ),
      body: Container(
        child: WebViewWidget(
              controller: controller,
            // initialUrl: widget.blogUrl,
            // onWebViewCreated: ((WebViewController webViewController){
            //   _completer.complete(webViewController);}
            )

        ),
      );
  }
}
