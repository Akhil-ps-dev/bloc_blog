import 'package:bloc_blog/data/models/res/login_token.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:bloc_blog/data/datasource/dio_client.dart';
import 'package:bloc_blog/data/datasource/endpoints.dart';
import 'package:bloc_blog/data/models/req/login_req_model.dart';
import 'package:bloc_blog/data/models/res/login_res_model.dart';

class LoginRepository {
  final DioClient _dioClient = DioClient(Dio());

  Future<LoginResModel?> login(LoginReqModel loginReqModel) async {
    try {
      final response = await _dioClient.mainReqRes(
        endPoints: EndPoints.login,
        data: loginReqModel.toJson(),
      );
      if (response.statusCode == 200) {
        final loginResponse = LoginResModel.fromJson(response.data);
        if (loginResponse.data?.token != null) {
          Get.find<LoginTokenRes>().token = loginResponse.data!.token!;
          print("token ${loginResponse.data?.token}");
          return loginResponse;
        } else {
          return LoginResModel(error: "Something went wrong", success: false);
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
