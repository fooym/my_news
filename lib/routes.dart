import 'pages/sign_in/sign_in.dart';
import 'pages/sign_up/sign_up.dart';

import 'pages/application/application.dart';

var staticRoutes = {
  "/sign-in": (context) => SignInPage(), // 登录
  "/sign-up": (context) => SignUpPage(), // 注册
  "/app": (context) => ApplicationPage(),
};
