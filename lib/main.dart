import 'feature/login/view/login_view.dart';
import 'product/model/concrete/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/init/locale/locale_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  runApp(
    MultiProvider(providers: [
      Provider.value(value: UserManager()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
