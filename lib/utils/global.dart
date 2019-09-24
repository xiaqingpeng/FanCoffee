/*
 * @Author: meetqy
 * @since: 2019-09-24 14:23:27
 * @lastTime: 2019-09-24 15:35:56
 * @LastEditors: meetqy
 */
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/CustomColors.dart';


/// global
class G {
  static GlobalKey<NavigatorState> navigatorKey=GlobalKey();
  /// toolbar routeName
  static List toobarRouteNameList = ['/', '/menu', '/order', '/shopping_cart', '/mine'];

  /// 获取当前的state
  static NavigatorState getCurrentState() {
    return navigatorKey.currentState;
  }

  /// 获取当前的context
  static BuildContext getCurrentContext() {
    return navigatorKey.currentContext;
  }

  /// 跳转页面使用 G.pushNamed
  static pushNamed(String routeName, {Object arguments}){
    // 如果跳转到toolbar页面 删除之前的所有page
    if(toobarRouteNameList.indexOf(routeName) > -1) {
      return getCurrentState().pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
    }

    getCurrentState().pushNamed(routeName, arguments: arguments);
  }

  /// 获取屏幕上下边距
  /// 用于兼容全面屏，刘海屏
  static EdgeInsets screenPadding() {
    return MediaQuery.of(getCurrentContext()).padding;
  }

  /// 获取屏幕宽度
  static double screenWidth() {
    return MediaQuery.of(getCurrentContext()).size.width;
  }

  /// 获取屏幕高度
  static double screenHeight() {  
    return MediaQuery.of(getCurrentContext()).size.height;
  }

  /// 底部border
  /// ```
  /// @param {Color} color
  /// @param {bool} show  是否显示底部border
  /// ```
  static Border borderBottom({Color color, bool show = true}){
    return Border(
      bottom: BorderSide(
        color: (color == null || !show)  ? (show ? CustomColors.whiteLighter : Colors.transparent) : color,
        width: 1
      )
    );
  }
}