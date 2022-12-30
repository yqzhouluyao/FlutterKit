//简单的应用状态管理 https://flutter.cn/docs/development/data-and-backend/state-mgmt/simple

import 'package:flutter/material.dart';
import 'package:flutterkit/tabs/home/course_detail/viewmodel/course_detail_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../common/title_bar.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/global_constants.dart';
import 'course_detail.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({Key? key}) : super(key: key);

  @override
  State<CourseDetailPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<CourseDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String title = "课程详情";
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 0,
          title: TitleBar(
            title,
            titleTextColor: const Color(0xff333333),
            leftWidget: Container(
              width: 44,
              margin: const EdgeInsets.only(right: 46),
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
            rightWidget:
            Container(width: 44, margin: const EdgeInsets.only(right: 46)),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0),
      body: ChangeNotifierProvider(
          create: (context) => CourseDetailViewModel(),
          child: const CourseDetail()),
    );
  }
}