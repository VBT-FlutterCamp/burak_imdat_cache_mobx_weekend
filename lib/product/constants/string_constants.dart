class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance => _instance ??= StringConstants._init();
  StringConstants._init();
  final String emailHint = 'E-mail';
  final String passHint = 'Password';
  final String loginButtonText = 'LOGIN';
  final String errorText = 'Wrong Credentials';
}
