import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/global_constants.dart';
import '../../../../common/title_bar.dart';
import '../viewmodel/goods_list_view_model.dart';
import 'goods_list_widget.dart';

class GoodsListPage extends StatefulWidget {
  const GoodsListPage({Key? key}) : super(key: key);

  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String title = "ๅๅๅ่กจ";
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
          create: (context) => GoodsListViewModel(),
          child: const GoodsListWidget()),
    );
  }
}
