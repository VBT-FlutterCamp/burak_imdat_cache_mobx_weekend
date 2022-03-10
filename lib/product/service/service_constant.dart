import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vexana/vexana.dart';

class ServiceConstant {
  static ServiceConstant? _instance;
  static ServiceConstant get instance => _instance ??= ServiceConstant._init();
  ServiceConstant._init() {
    networkManager = NetworkManager(
      options: BaseOptions(baseUrl: 'https://reqres.in/api'),
    );
    networkManager.dioIntercaptors.add(PrettyDioLogger());
  }
  late INetworkManager networkManager;
}
