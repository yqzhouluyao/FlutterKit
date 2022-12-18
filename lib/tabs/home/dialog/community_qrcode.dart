import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityQRCode extends StatelessWidget {
  const CommunityQRCode();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            height: 458,
            width: 311,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("images/community_qrcode.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Spacer(),
                    Image(
                      image: AssetImage("images/check_green.png"),
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                     '讲座预约成功',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff333333),
                        decoration: TextDecoration.none,
                      ),
                      softWrap: true,
                    ),
                    Spacer(),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '可在 「 我的课程 」中查看',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff2c2d2e),
                          decoration: TextDecoration.none,),
                        softWrap: true,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          const Image(
                            image: AssetImage("images/right_angle.png"),
                            height: 124,
                            width: 124,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Image.network(
                              'https://upload-images.jianshu.io/upload_images/5809200-a99419bb94924e6d.jpg',
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('加班主任微信，接收重要学习提醒', //服务类型；1班群 2班主任
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16, color: Color(0xfffa6400),
                          decoration: TextDecoration.none,),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '截图保存图片，微信识别二维码',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff333333),
                          decoration: TextDecoration.none,),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            height: 30,
            width: 341,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Image(
                        image: AssetImage("images/alertview_close.png"),
                        fit: BoxFit.fill,
                        height: 30,
                        width: 30,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );;
  }
}
