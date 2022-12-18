
import 'global_constants.dart';

class AppInfo {
  bool? _isLogin = false;
  String? auth;
  bool isChiral = false;

  static bool isProduction = const bool.fromEnvironment("dart.vm.product");

  get isDebug => !isProduction;

  static AppInfo? instance;

  static AppInfo? getInstance() {
    instance ??= AppInfo();
    return instance;
  }

  String get productName {
    if (AppInfo.instance!.isChiral) {
      return GlobalConst.appName;
    }
    return '';
  }
}