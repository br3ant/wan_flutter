import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wan_flutter/common/utils/save/sp_key.dart';
import 'package:wan_flutter/pages/login/entity/userinfo.dart';

/// @class : SpUtil
/// @date : 2021/08/19
/// 
/// @description :键值对存储
class SpUtil {


  ///更新用户信息，需要保存密码
  ///[userInfo] 用户信息
  static notifyUserInfo(UserEntity userInfo){
    var oldInfo = getUserInfo();
    if(oldInfo != null){
      userInfo.password = oldInfo.password;
    }
    SpUtil.deleteUserInfo();
    SpUtil.putUserInfo(userInfo);
  }

  ///删除存储用户信息
  static deleteUserInfo() {
    Get.find<SharedPreferences>().remove(SPKey.keyUserInfo);
  }

  ///存储用户信息
  ///[userInfo] 用户信息
  static putUserInfo(UserEntity userInfo) {
    Get.find<SharedPreferences>()
        .setString(SPKey.keyUserInfo, jsonEncode(userInfo.toJson()));
  }

  ///获取用户信息
  ///[UserEntity] 用户信息
  static UserEntity? getUserInfo() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(SPKey.keyUserInfo);
      if (json == null) {
        return null;
      } else {
        return UserEntity.fromJson(jsonDecode(json));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }







  /// 搜索历史记录
  /// [word] 搜索记录
  static saveSearchHistory(String word) {
    var history = getSearchHistory();
    if(history.contains(word)){
      return;
    }
    history.insert(0 , word);
    Get.find<SharedPreferences>()
        .setStringList(SPKey.searchHistory, history);
  }

  ///清空搜索历史
  static void deleteSearchHistory(){
    Get.find<SharedPreferences>().remove(SPKey.searchHistory);
  }

  ///获取搜索历史记录
  static List<String> getSearchHistory() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getStringList(SPKey.searchHistory);
      if (json == null) {
        return [];
      } else {
        return json;
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  ///浏览记录长度
  static int getBrowseHistoryLength() {
    return getBrowseHistory().length;
  }


  ///获取浏览历史记录
  static List<String> getBrowseHistory() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getStringList(SPKey.browseHistory);
      if (json == null) {
        return [];
      } else {
        return json;
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }


}
