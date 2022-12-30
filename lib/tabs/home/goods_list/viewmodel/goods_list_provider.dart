
import 'package:flutterkit/network/api.dart';
import 'package:flutterkit/network/result_data.dart';

import '../../course_detail/model/course_detail_model.dart';
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

   ///获取课程详情
   Future<CourseDetailModel?> getCourseDetail(int classId) async {
     ResultData resultData = await httpManager.requestUrl(
         "v3/offline/getByClassId",
         baseUrl: HttpManager.baseLdlUrl,
         params: {
           'class_id': classId,
         }
     );

     if (resultData?.code == 1) {
       CourseDetailModel courseDetailModel = CourseDetailModel.fromJson(resultData.data as Map<String, dynamic>);
       return courseDetailModel;
     }
     return null;
   }
}