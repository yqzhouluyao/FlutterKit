import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterkit/tabs/home/goods_list/bloc/goods_list_bloc.dart';
import 'package:flutterkit/tabs/home/goods_list/model/goods_list_model.dart';

class GoodsListPage extends StatefulWidget {
  const GoodsListPage({Key? key}) : super(key: key);

  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  late GoodsListBloc _bloc;
  ScrollController _scrollController = ScrollController();
  int _page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.initData(_page);
    _bloc.addScrollListener(_scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: _bloc.goodsList,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data) {
            return Container(
              child: ListView.builder(itemBuilder: (context,index){
                GoodsList goodsModel = snapshot.data[index];
                return  Text(
                  goodsModel.title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.red),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              }),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
