import '../../../product/model/concrete/user_manager.dart';
import '../../../product/textfield/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view.dart';
import '../../../product/padding/page_padding.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel model) => Scaffold(
        body: Padding(
          padding: PagePadding.normalAll(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _mailAppTextField(model),
              context.emptySizedHeightBoxNormal,
              _passwordAppTextField(model),
              context.emptySizedHeightBoxNormal,
              _loginButton(model)
            ],
          ),
        ),
      ),
    );
  }

  Observer _loginButton(LoginViewModel model) {
    return Observer(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          model.isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  child: Text(model.strings.loginButtonText),
                  onPressed: () => model.login(),
                ),
        ],
      );
    });
  }

  AppTextField _mailAppTextField(LoginViewModel model) {
    return AppTextField(
      hint: model.strings.emailHint,
      controller: model.emailController,
    );
  }

  AppTextField _passwordAppTextField(LoginViewModel model) {
    return AppTextField(
      hint: model.strings.passHint,
      controller: model.passwordController,
      isPassword: true,
    );
  }
}
