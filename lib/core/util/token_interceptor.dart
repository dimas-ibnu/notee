import 'package:dio/dio.dart';
import 'package:notee/config/base_url_config.dart';
import 'package:notee/config/constant_config.dart';


class TokenInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Here you can put the token, either from preference, sqlite, etc.
    // Here is an example with Preferences
    // final someToken = getToken();
    // After you choose your token, you assign it to the request.

    /// Add api key and country parameter to every request
    options.queryParameters['apiKey'] = ConstantConfig.newsApiKeyConfig;
    options.queryParameters['country'] = BaseUrlConfig.countryIdConfig;
    options.queryParameters['pageSize'] = '10';

    /// Remove country parameter if path contains everything
    if(options.path.contains('everything')) {
      options.queryParameters.remove('country');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    // Do something with response data
    super.onResponse(response, handler);
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // If the error is 401 Unauthorized, log out the user
    if (err.response?.statusCode == 401) {
    }
    super.onError(err, handler);
  }

  // String getToken() {
  //   final userData = AppStorage.getUser();
  //   if (userData != null) {
  //     return userData.token ?? AppConstant.accessToken;
  //   } else {
  //     return AppConstant.accessToken;
  //   }
  // }
}
