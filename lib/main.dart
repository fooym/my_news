import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_news/pages/welcome/welcome.dart';
import 'package:my_news/routes.dart';

import 'global.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(
              title: 'Flutter Demo',
              home: WelcomePage(),
              routes: staticRoutes,
              debugShowCheckedModeBanner: false,
            ));
  }
}
