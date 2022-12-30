import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/global_constants.dart';
import '../constants/icon_font.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final IconData? iconDataRight;
  final IconData? iconDataLeft;

  final VoidCallback? onRightIconPressed;
  final VoidCallback? onLeftIconPressed;

  final bool needRightLocalIcon;
  final bool needLeftLocalIcon;

  final Widget? rightWidget;
  final Widget? leftWidget;

  final Color titleTextColor;

  final GlobalKey rightKey = GlobalKey();
  final GlobalKey leftKey = GlobalKey();

  TitleBar(this.title,
      {this.iconDataRight,
        this.iconDataLeft,
         this.onRightIconPressed,
      this.needRightLocalIcon = false,
      this.needLeftLocalIcon = false,
         this.onLeftIconPressed,
       this.rightWidget,
       this.leftWidget,this.titleTextColor = ThemeColor.colorBlack});

  @override
  Widget build(BuildContext context) {
    Widget? widgetRight = rightWidget;
    if (rightWidget == null) {
      widgetRight = (needRightLocalIcon)
          ? IconButton(
              icon: Icon(
                iconDataRight,
                key: rightKey,
                size: 16.0,
              ),
              onPressed: onRightIconPressed)
          : Container(
              width: 44,
            );
    }
    Widget? widgetLeft = leftWidget;
    if (leftWidget == null) {
      widgetLeft = (needLeftLocalIcon)
          ? IconButton(
              icon: iconDataLeft != null
                  ? Icon(
                      iconDataLeft,
                      key: leftKey,
                      size: 20.0,
                    )
                  : Icon(
                      IconFont.arrow_back,
                      key: leftKey,
                      size: 20.0,
                      color: Theme.of(context).textTheme.subtitle1?.color,
                    ),
              onPressed: onLeftIconPressed)
          : Container();
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: widgetLeft,
            height: GlobalConst.navHeight,
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                semanticsLabel: title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontWeight:
                        Platform.isIOS ? FontWeight.w500 : FontWeight.w600,color: titleTextColor),
              ),
            ),
          ),
          SizedBox(
            height: GlobalConst.navHeight,
            child: widgetRight,
          ),
        ],
      ),
    );
  }
}
