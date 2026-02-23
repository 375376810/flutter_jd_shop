import 'package:flutter/material.dart';
import 'package:flutterjdshop/widgets/my_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

///搜索页
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  //const SearchPage({Key? key, this.cookieManager}) : super(key: key);
  //final CookieManager? cookieManager;

  @override
  State<SearchPage> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  // 1. 新版需要先创建 WebViewController
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // 2. 初始化控制器（新版核心：所有配置都在控制器中设置）
    _controller = WebViewController()
      // 设置网页加载相关配置
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // 开启JS
      ..setNavigationDelegate(
        NavigationDelegate(
          // 网页开始加载回调
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          // 网页加载完成回调
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          // 拦截网页跳转
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.baidu.com')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      // 加载初始网页
      ..loadRequest(Uri.parse('https://www.baidu.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索页面', style: TextStyle(color: Colors.black54, fontSize: 18)),
        foregroundColor: MyColors.mainBackgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (await _controller.canGoBack()) {
                _controller.goBack();
              } else {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('已到网页最开始')),
                  );
                }
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () async {
              if (await _controller.canGoForward()) {
                _controller.goForward();
              } else {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('已到网页最后')),
                  );
                }
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
        ],
      ),
      body: Stack(
        children: [
          // 3. 新版核心组件：WebViewWidget（替代旧的 WebView）
          WebViewWidget(
            controller: _controller, // 必须传入初始化好的控制器
          ),
          // 加载中动画
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
