import '../../model/login_request_model.dart';
import '../../model/login_response_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  INetworkManager networkManager;
  ILoginService(this.networkManager);

  Future<LoginResponseModel?> login(LoginRequestModel data);
}
