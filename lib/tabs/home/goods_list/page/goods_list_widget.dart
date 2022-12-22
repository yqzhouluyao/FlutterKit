import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutterkit/tabs/home/goods_list/bloc/goods_list_bloc.dart';
import 'package:flutterkit/tabs/home/goods_list/model/goods_list_model.dart';
import 'package:flutter/material.dart';

class GoodsListWidget extends StatefulWidget {
  const GoodsListWidget({Key? key}) : super(key: key);

  @override
  State<GoodsListWidget> createState() => _GoodsListWidgetState();
}

class _GoodsListWidgetState extends State<GoodsListWidget> {
  late GoodsListBloc _bloc;
  final ScrollController _scrollController = ScrollController();
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
          if (snapshot.hasData) {
            return Container(
              child: ListView.builder(
                  itemBuilder: (context,index){
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
              },
                  itemCount: snapshot.data!.length,
                  controller: _scrollController,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
