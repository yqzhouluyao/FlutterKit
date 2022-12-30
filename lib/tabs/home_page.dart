import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterkit/tabs/home/goods_list/page/goods_list_page.dart';

import 'home/course_detail/page/course_detail_page.dart';
import 'home/dialog/community_qrcode.dart';
import 'home/webview/user_notice.dart';

class HomePage extends StatelessWidget {

   List<String> functionList = ['打开一个webview(WebView、Timer、StreamController)',
     '弹出一个定制的dialog(showDialog)',
     '使用event_bus发送、监听通知',
     '网络请求、模型赋值',
     '课程详情'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         itemCount: functionList.length,
        itemBuilder: (context,index){
           return ListTile(
             // leading: const Icon(Icons.shopping_cart),
             title: Text(functionList[index]),
             trailing:  const Icon(Icons.more),
             onTap: (){
              if (functionList[index] == '打开一个webview(WebView、Timer、StreamController)') {
                openUserNotice(context);
              } else if (functionList[index] == '弹出一个定制的dialog(showDialog)') {
                showCommunityQRCode(context);
              } else if (functionList[index] == '使用event_bus发送、监听通知') {

              } else if (functionList[index] == '网络请求、模型赋值') {
                requestGoodsList(context);
              } else if (functionList[index] == '课程详情') {
                requestCourseDetail(context);
              }

             },
           );
        });
  }

  //打开一个webview
   void openUserNotice(context) {
     String userNotesUrl = "https://www.baidu.com/";
     Navigator.of(context)
         .push(MaterialPageRoute(builder: (_) {
       return  UserNoticePage(
         url: userNotesUrl,
         title: "用户须知",
         agreeUserNoticeCallBack:agreeUserNoticeCallBack,
       );
     }));
   }

  //同意用户协议的回调
   void agreeUserNoticeCallBack() {
     print('用户协议');
   }

   //弹出一个定制的dialog
   showCommunityQRCode(context){
     showDialog(
         context: context,
         barrierDismissible: false,
         builder: (BuildContext context) {
           return const CommunityQRCode();
         });
   }

   //网络请求、模型赋值
   requestGoodsList(context) {
     Navigator.of(context)
         .push(MaterialPageRoute(builder: (_) {
       return   const GoodsListPage();
     }));
  }

  //课程详情
   requestCourseDetail(context) {
     Navigator.of(context)
         .push(MaterialPageRoute(builder: (_) {
       return   const CourseDetailPage();
     }));
   }

}
