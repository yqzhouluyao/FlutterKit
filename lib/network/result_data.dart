
class ResultData {
  /// [Response.data] 或 错误信息
  Map? data;

  /// 错误码 -1 请求失败， 请求成功 1, 500 系统错误， 401 认证失败，404 页面不存在
  int code;

  ResultData(this.data, this.code);
}
