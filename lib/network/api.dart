
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutterkit/constants/app.dart';
import 'package:flutterkit/network/result_data.dart';
import '../constants/global_constants.dart';
import 'code.dart';
import 'config.dart';

final HttpManager httpManager = HttpManager();

class Api {
  static get baseZtUrl => AppInfo.isProduction
      ? GlobalConst.BASE_URL_RELEASE_ZT
      : GlobalConst.BASE_URL_ALPHA_ZT;
}

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static final _baseUrlAlpha = "${Config.baseUrlAlpha}";
  static final _baseUrl = "${Config.baseUrlRelease}";


  static get baseUrl => AppInfo.isProduction ? _baseUrl : _baseUrlAlpha;
  /// 静态站url
  static get baseUrlStatic => AppInfo.isProduction ? Config.baseUrlStatic : Config.baseUrlAlphaStatic;

  static get baseLdlUrl =>
      AppInfo.isProduction ? Config.baseLdlUrlRelease : Config.baseLdlUrlAlpha;

  static get basePassportUrl =>
      AppInfo.isProduction ? Config.basePassportUrlRelease : Config.basePassportUrlAlpha;

  Dio _dio = Dio();
  // 使用默认配置

  final List<Interceptor> _commonInterceptors = [
    LogInterceptor(requestBody: AppInfo.getInstance()!.isDebug),
    //    TokenInterceptors(),
  ];

  HttpManager() {
    _commonInterceptors.forEach((Interceptor interceptor) {
      _dio.interceptors.add(interceptor);
    });
  }

///requestUrl 用法
/// 接口返回ResultData数据
/// 如果正常返回： ResultData.data 返回一个Map，供业务函数做模型解析， ResultData.code为1
/// 如果捕获错误： ResultData.data 返回一个Map({'message':'error reason'})，
///             提供错误信息，ResultData.code为-1
///
/// 比如接口调用:
///   Future<ShoppingCartResponse> getCart({int goodsType}) async {
///    ResultData resultData = await httpManager.requestUrl(
///        "${Config.apiUrlSuffix}/cart/get",
///        baseUrl: HttpManager.baseLdlUrl,
///        params: {'goods_type': goodsType});
///    if (resultData?.code == 1){
///      ShoppingCartResponse res = ShoppingCartResponse.fromJson(resultData.data);
///      return res;
///    }
///    return null;
///    /// 也可以把异常数据resultData抛给业务调用
///    /// throw Exception(resultData.data.toString());
///  }
///
/// 比如业务调用：
/// cartApiProvider
///        .getCart(goodsType: goodsType)
///        .then((ShoppingCartResponse response) {
///      List<Object> mAllData = this.mAllData;
///      if (response.code == 1) {
///       /// ...业务数据处理
///      }
///      return mAllData;
///    }).whenComplete(() {
///      /// 请求完成， 隐藏loading
///      showLoading(false);
///    }).catchError((Object e) {
///      /// 在这里处理接口错误， 渲染"加载失败UI"
///      ///接getCart方法的Exception， e的值 Exception: {message: ***}
///      debugPrintStack();
///      return null;
///    });
///
///
///
///
/// 新的请求接口
/// 用于get请求和  lapi.eduzhixin.com 的post请求
/// 请求contentType值[CONTENT_TYPE_JSON]
///[ url] 请求url
///[ params] 请求参数
///[ method] 请求方式
///[ option] 配置

  Future<ResultData> requestUrl(url,
      {params,
        Options? option,
        String? method,
        Options? options,
        String? baseUrl}) async {
    _setBaseUrl(baseUrl, url);
    option ??= new Options();
    option.method = method ?? HttpMethod.GET;
    log("[HttpManager fetch] ${_dio.options.baseUrl}" + url +" ${params.toString()}");

    Response<Map>? response;
    try {
      if (option.method == HttpMethod.GET) {
        response = await _dio.get<Map>(
          url,
          queryParameters: params,
          options: option,
        );
      } else if (option.method == HttpMethod.POST) {
        response = await _dio.post<Map>(
          url,
          data: params,
          options: option,
        );
      }
      if (AppInfo.getInstance()!.isDebug) {
        // print("[HttpManager header]" + response.headers.toString());
        // print("[HttpManager fetch]" + response.toString());
        // log("[HttpManager fetch] " +  response.headers.toString());
      }

      if (response == null || response.statusCode != 200) {
        return ResultData(
            {'message': 'error: ${response!.statusMessage}'}, Code.FAILED);
      } else {
        log(response.toString());
      }

      assert(response.data is Map);
      return ResultData(response.data, Code.SUCCESS);
    } on DioError catch (e) {
      Map<String, dynamic> map = new Map();
      map["message"] = e.error;
      return ResultData(map, Code.FAILED);
    } catch (e) {
      Map<String, dynamic> map = new Map();
      map["message"] = e.toString();
      return ResultData(map, Code.FAILED);
    }
  }



  _setBaseUrl(String? baseUrl, String url) {
    assert(_dio != null);
    if (url != null && RegExp(r"^http[s]?:\/\/|\/\/").hasMatch(url)) {
      _dio.options?.baseUrl = '';
    } else if (baseUrl == null || baseUrl.isEmpty) {
      _dio.options?.baseUrl = AppInfo.isProduction ? _baseUrl : _baseUrlAlpha;
    } else {
      _dio.options?.baseUrl = baseUrl;
    }
  }
}

class HttpMethod {
  static const String GET = 'GET';
  static const String POST = 'POST';
}

