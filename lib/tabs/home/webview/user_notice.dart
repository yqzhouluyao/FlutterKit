import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterkit/common/title_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../constants/colors.dart';
import '../../../constants/global_constants.dart';

class UserNoticePage extends StatefulWidget {
  final String url;
  final String title;
  final Function agreeUserNoticeCallBack;

  const UserNoticePage(
      {required this.url,
        required this.title,
        required this.agreeUserNoticeCallBack,
        key})
      : super(key: key);

  @override
  State<UserNoticePage> createState() => _UserNoticeState();
}

class _UserNoticeState extends State<UserNoticePage> {
  ///单订阅流
  final StreamController<double> _streamController = StreamController();

  ///计时器
  late Timer _timer;


  ///当前的时间
  double currentTimeNumber = 6000;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///当前页面绘制完第一帧后回调
      ///在这里开启定时器
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

    ///关闭
    _streamController.close();
  }

  void startTimer() {
    ///间隔100毫秒执行时间
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      ///间隔100毫秒执行一次 每次减100
      currentTimeNumber -= 100;

      ///如果计完成取消定时
      if (currentTimeNumber <= 100) {
        _timer.cancel();
        currentTimeNumber = 100;
      }

      ///流数据更新
      _streamController.add(currentTimeNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        leading: Text(''),
        title: TitleBar(
          widget.title,
          titleTextColor: Colors.white,
          leftWidget: Container(
            width: 44,
            margin: EdgeInsets.only(right: 46),
            child: IconButton(
              icon: Image.asset(
                "images/icon_nav_back_black.png",
                color: ThemeColor.textColorTitle,
                width: 20,
                height: GlobalConst.navHeight,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          rightWidget: Container(width: 44, margin: EdgeInsets.only(right: 46)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted),
          ),
          Container(
            child: buildStreamBuilder(),
            // margin: EdgeInsets.only(top: 20, left: 20),
          ),
        ],
      ),
    );
  }

  /// 监听Stream，每次值改变的时候，更新Text中的内容
  StreamBuilder<double> buildStreamBuilder() {
    return StreamBuilder<double>(
      ///绑定stream
      stream: _streamController.stream,

      ///默认的数据
      initialData: 0,

      ///构建绑定数据的UI
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        bool enableClick =
        (snapshot.data == 0) ? false : (snapshot.data! / 1000) < 1;

        return GestureDetector(
          onTap: enableClick
              ? () {
            Navigator.of(context).pop();
            widget.agreeUserNoticeCallBack();
          }
              : null,
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color:
              enableClick ? const Color(0xff00C7BF) : const Color(0xffF3F3F3),
              child: IndexedStack(
                alignment: Alignment.center,
                index: enableClick ? 0 : 1,
                children: [
                  TextButton(
                    onPressed: () {  },
                    child: const Text(
                      '我已知晓',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {  },
                    child: RichText(
                      text: TextSpan(
                        text: '我已知晓 ',
                        style: const TextStyle(
                            fontSize: 18, color: Color(0xff333333)),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${(snapshot.data! / 1000).toStringAsFixed(0)}s',
                            style: TextStyle(color: Color(0xff00C7BF)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
