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

  PageList.formJson(Map<String, dynamic> page, T Function(dynamic d) toElement) {
    curPage = page['curPage'];
    size = page['size'];
    for (var json in page['datas']) {
      datas.add(toElement(json));
    }
  }
}
