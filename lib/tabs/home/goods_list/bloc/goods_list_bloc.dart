
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterkit/tabs/home/goods_list/model/goods_list_model.dart';
import 'package:rxdart/rxdart.dart';

import 'goods_api_provider.dart';

class GoodsListBloc implements Bloc {

  //商品list
  final _goodsListFetcher = PublishSubject<List<GoodsList>>();

  Stream<List<GoodsList>> get goodsList => _goodsListFetcher.stream;
  
  int _page = 1;
  bool _isLoadMore = false; //是否加载更多 false:加载更多
  bool _isLoad = false; //判断是第一次加载没有数据 还是上拉加载没有数据  true为上拉加载没有数据
  late List<GoodsList> _goodsList;
  
  initData(int page) {
    Future<GoodsListModel?> future = GoodsApiProvider().getGoodsList(page, 10);
    future.then((value) {
      if (value?.data!.list == null || (value!.data!.list!.length > 0)) {
        if (_isLoad) {
          //上拉加载没有数据
          _isLoadMore = true;
        }
        return;
      }else {
        _goodsList.addAll(value!.data!.list!);
        if(!_goodsListFetcher.isClosed) {
          _goodsListFetcher.sink.add(_goodsList);
        }
      }
    });
  }

  addScrollListener(ScrollController scrollController) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent &&!_isLoadMore) {
        _isLoad = true;
        _page++;
        initData(_page);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _goodsListFetcher.close();
  }

}