

import 'package:flutter/cupertino.dart';


import '../../goods_list/viewmodel/goods_list_provider.dart';
import '../model/course_detail_model.dart';

class CourseDetailViewModel extends ChangeNotifier {

  late CourseDetailModel courseDetailModel;

  initData(int classid) {
    Future<CourseDetailModel?> future = GoodsApiProvider().getCourseDetail(classid);
    future.then((value) {
      if (value!.data != null) {
        courseDetailModel = value;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

  }

}