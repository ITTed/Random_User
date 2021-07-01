import 'package:randomuser_app/logic/model/user_model.dart';
import 'package:randomuser_app/logic/service/service.dart';

class UserRepository {
  ServiceApi _userProvider = ServiceApi();
  Future<RandomUser> getUser() => _userProvider.getUser();
}