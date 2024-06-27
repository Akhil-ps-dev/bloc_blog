import 'package:bloc_blog/data/datasource/dio_client.dart';

enum EndPoints {
  login,
  home,
}

extension EndPointsExtension on EndPoints {
  String path() {
    String path = "";

    switch (this) {
      case EndPoints.login:
        path = "login";
        break;
      case EndPoints.home:
        path = "get-all-blogs";
        break;
    }

    return path;
  }

  HttpMethod method() {
    HttpMethod method;

    switch (this) {
      case EndPoints.login:
        method = HttpMethod.post;
        break;
      case EndPoints.home:
        method = HttpMethod.get;
        break;
    }

    return method;
  }

  bool hasToken() {
    bool hasToken = false;

    switch (this) {
      case EndPoints.login:
        hasToken = false;
        break;
      case EndPoints.home:
        hasToken = true;
        break;
    }

    return hasToken;
  }
}
