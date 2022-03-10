import '../../../core/init/mixin/cache_manager.dart';
import '../../home/view/home_view.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';
import '../service/abstract/login_service.dart';
import '../service/concrete/login_manager.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view_model.dart';
import '../../../core/init/enums/preferences_key_enum.dart';
import '../../../product/constants/string_constants.dart';
import '../../../product/model/concrete/user_manager.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel, CacheManager {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    loginManager = LoginManager(manager);
  }

  final StringConstants strings = StringConstants.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final ILoginService loginManager;

  @observable
  bool isLoading = false;

  @action
  Future<void> login() async {
    changeLoading();
    final response = await loginManager.login(LoginRequestModel(email: emailController.text, password: passwordController.text));
    if (response?.token != null && response != null) {
      await keepUser(response);
      changeLoading();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView(token: response.token!)),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Padding(
            padding: context.paddingNormal,
            child: Text(
              strings.errorText,
              style: context.textTheme.headline6?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ),
        ),
      );
      clearTextField();
      changeLoading();
    }
  }

  void clearTextField() {
    emailController.text = '';
    passwordController.text = '';
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}

extension _LoginViewModelBaseCache on _LoginViewModelBase {
  Future<void> keepUser(LoginResponseModel model) async {
    await saveData(PreferencesKey.user, model);
    context.read<UserManager>().saveUser(model);
  }
}
