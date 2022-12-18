
import 'package:flutterkit/network/api.dart';
import 'package:flutterkit/network/result_data.dart';

import '../model/goods_list_model.dart';

class GoodsApiProvider {
  ///获取商品列表
   Future<GoodsListModel?> getGoodsList(int page,int pageSize) async {
      ResultData resultData = await httpManager.requestUrl(
          "v3/protonstore/getGoodsList",
          baseUrl: HttpManager.baseLdlUrl,
          params: {
             'page': page,
             'page_size': pageSize,
          }
      );

      if (resultData?.code == 1) {
         GoodsListModel goodsList = GoodsListModel.fromJson(resultData.data as Map<String, dynamic>);
         return goodsList;
      }
      return null;
   }
}