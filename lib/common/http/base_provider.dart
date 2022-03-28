import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:wan_flutter/common/http/base_response.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    print("BaseProvider onInit");
    httpClient.baseUrl = 'https://www.wanandroid.com/';

    // 请求拦截
    httpClient.addRequestModifier<void>((request) {
      print("request->${request.url}");
      return request;
    });

    // 响应拦截
    httpClient.addResponseModifier((request, response) {
      print("http-> ${response.bodyString}");
      return response;
    });
  }
}

extension BaseResponseParsing on Response {
  BaseResponse toBaseResponse() {
    var response = this;
    if (response.hasError) throw GetHttpException(response.statusText ?? "");
    final baseResponse = BaseResponse.formJson(response.body as Map<String, dynamic>);
    if (baseResponse.errorCode != 0) throw GetHttpException(baseResponse.errorMsg);
    return baseResponse;
  }
}
