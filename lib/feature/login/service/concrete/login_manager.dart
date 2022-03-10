import '../../model/login_request_model.dart';
import '../../model/login_response_model.dart';
import '../abstract/login_service.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

class LoginManager extends ILoginService {
  LoginManager(INetworkManager networkManager) : super(networkManager);

  @override
  Future<LoginResponseModel?> login(LoginRequestModel data) async {
    final response = await networkManager.send<LoginResponseModel, LoginResponseModel>('/login',
        parseModel: LoginResponseModel(), method: RequestType.POST, data: data.toJson());
    return response.data;
  }
}
