class BaseResponse<T> {
  T? data;
  int errorCode = 0;
  String errorMsg = "";

  BaseResponse.formJson(Map<String, dynamic> response) {
    data = response['data'];
    errorCode = response['errorCode'];
    errorMsg = response['errorMsg'];
  }
}

class PageList<T> {
  int curPage = 0;
  int size = 0;
  List<T> datas = [];

  ///是否为最后一页
  bool over = false;

  PageList.formJson(Map<String, dynamic> page, T Function(dynamic d) toElement) {
    curPage = page['curPage'];
    size = page['size'];
    over = page['over'];
    datas = <T>[for (var json in page['datas']) toElement(json)];
  }
}
