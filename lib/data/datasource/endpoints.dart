import 'package:bloc_blog/data/datasource/dio_client.dart';

enum EndPoints {
  login,
}

extension EndPointsExtension on EndPoints {
  String path() {
    String path = "";

    switch (this) {
      case EndPoints.login:
        path = "login";
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
    }

    return method;
  }

  bool hasToken() {
    bool hasToken = false;

    switch (this) {
      case EndPoints.login:
        hasToken = false;
        break;
    }

    return hasToken;
  }
}
