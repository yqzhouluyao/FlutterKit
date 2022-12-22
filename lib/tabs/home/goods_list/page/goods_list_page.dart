import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/goods_list_bloc.dart';
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
    final String title = "商品列表";
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 0,
          title: Text(title,
            style:const TextStyle(
            fontSize: 22,
            color: Color(0xff333333),
            decoration: TextDecoration.none,
          ),),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0),
      body: BlocProvider(
          creator: (_context,_tag) =>GoodsListBloc(),
            child: GoodsListWidget()),);
  }
}
