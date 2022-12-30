// https://alpha-lapi.upho2015.com/v1/offline/getByClassId?class_id=123

import 'package:flutter/cupertino.dart';
import 'package:flutterkit/tabs/home/course_detail/viewmodel/course_detail_view_model.dart';
import 'package:provider/provider.dart';

import '../model/course_detail_model.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  final _courseDetailVM = CourseDetailViewModel();
  final int classid = 123;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _courseDetailVM.initData(classid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseDetailModel>(
      builder: (context, courseDetailModel, child) {
        return Text('Total price: ${courseDetailModel.data.desp}');
      },
      child: Text("data"),
    );
  }
}
