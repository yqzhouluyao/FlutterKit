
import 'package:flutterkit/tabs/home/goods_list/model/goods_list_model.dart';
import 'package:flutter/material.dart';

import '../viewmodel/goods_list_view_model.dart';

class GoodsListWidget extends StatefulWidget {
  const GoodsListWidget({Key? key}) : super(key: key);

  @override
  State<GoodsListWidget> createState() => _GoodsListWidgetState();
}

class _GoodsListWidgetState extends State<GoodsListWidget> {
  final _goodsListVM = GoodsListViewModel();
  final ScrollController _scrollController = ScrollController();
  final int _page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _goodsListVM.initData(_page);
    _goodsListVM.addScrollListener(_scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _goodsListVM.goodsList,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemBuilder: (context,index){
            GoodsList goodsModel = snapshot.data[index];
            return  ListTile(
                title: Text(
                  goodsModel.title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.red),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              onTap: () {

              },
            );
          },
              itemCount: snapshot.data!.length,
              controller: _scrollController,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
