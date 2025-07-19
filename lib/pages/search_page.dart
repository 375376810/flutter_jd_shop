import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

///搜索页
class SearchPage extends StatefulWidget {
  //const SearchPage({Key? key, this.cookieManager}) : super(key: key);
  //final CookieManager? cookieManager;

  @override
  State<SearchPage> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      //WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索页面'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        /*child: WebView(
          initialUrl: 'https://www.baidu.com',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
            Fluttertoast.showToast(
              msg: "WebView is loading (progress : $progress%)",
              backgroundColor: Colors.black26,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
            );
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          backgroundColor: Colors.white,
        ),*/
      ),
    );
  }

 /* JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }*/
}
