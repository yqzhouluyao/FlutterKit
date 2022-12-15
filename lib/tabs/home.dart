import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/dialog/community_qrcode.dart';
import 'home/webview/user_notice.dart';

class HomePage extends StatelessWidget {

   List<String> functionList = ['打开一个webview','弹出一个定制的dialog','使用event_bus发送、监听通知'];

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
              if (functionList[index] == '打开一个webview') {
                openUserNotice(context);
              } else if (functionList[index] == '弹出一个定制的dialog') {
                showCommunityQRCode(context);
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
       return  UserNotice(
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
           return CommunityQRCode();
         });
   }
}
