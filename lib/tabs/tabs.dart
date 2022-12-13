import 'package:flutter/material.dart';
import 'package:flutterkit/tabs/home.dart';
import 'package:flutterkit/tabs/investment_principles.dart';
import 'package:flutterkit/tabs/setttings.dart';


class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  // 把页面存放到数组里
  final List _pageList = [
    HomePage(),
    InvestmentPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Kit'),
      ),
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 默认选中第几项
        currentIndex: _currentIndex,
        // 导航栏点击获取索引值
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 30.0, //icon的大小
        fixedColor: Colors.red, //选中的颜色
        type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
        //定义导航栏的图片+名称
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "投资原则"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "设置"),
        ],
      ),
    );
  }
}