import 'package:dio/dio.dart';
import 'package:randomuser_app/helper/dio_settings.dart';
import 'package:randomuser_app/logic/model/user_model.dart';

class ServiceApi {
  late DioSettings _dioSettings;
  late Dio _dio;

  late Map<String, dynamic> request;
  static ServiceApi _instance = new ServiceApi.internal();
  factory ServiceApi() => _instance;
  ServiceApi.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }
  Future<RandomUser> getUser() async {
    try {
      final response = await _dio.get('https://randomuser.me/api/1.3/');
      RandomUser user = RandomUser.fromJson(response.data);

      return user;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
