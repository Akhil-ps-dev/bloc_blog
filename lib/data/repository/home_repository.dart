import 'package:bloc_blog/data/datasource/dio_client.dart';
import 'package:bloc_blog/data/datasource/endpoints.dart';
import 'package:bloc_blog/data/models/res/home_res_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  Future<HomeResModel?> getHomeRes() async {
    final _dioClient = DioClient(Dio());
    try {
      final response = await _dioClient.mainReqRes(
        endPoints: EndPoints.home,
      );
      if (response.statusCode == 200) {
        final homeRes = HomeResModel.fromJson(response.data);
        return homeRes;
      } else {
        //else if ur api error code like 400, 401, 500
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
