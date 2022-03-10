import '../../../feature/login/model/login_response_model.dart';
import '../abstract/user_service.dart';

class UserManager extends IUserService {
  LoginResponseModel? loginResponseModel;
  bool isLogin = false;
  @override
  void clearData() {
    _changeLoginValue(false);
  }

  void _changeLoginValue(bool value) {
    isLogin = value;
  }

  @override
  void saveUser(LoginResponseModel responseModel) {
    loginResponseModel = responseModel;
    _changeLoginValue(true);
  }
}
