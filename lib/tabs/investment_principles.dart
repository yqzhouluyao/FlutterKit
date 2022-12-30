//使用 Firestore 调用 Firebase 服务  https://flutter.cn/docs/development/data-and-backend/firebase

import 'package:flutter/cupertino.dart';

class InvestmentPage extends StatefulWidget {
  InvestmentPage({Key? key}) : super(key: key);

  @override
  _InvestmentPageState createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {
  @override
  Widget build(BuildContext context) {
    return Text("我是投资原则");
  }
}