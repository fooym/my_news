import 'package:flutter/material.dart';
import 'package:my_news/pages/welcome/welcome.dart';
import 'package:my_news/routes.dart';

import 'global.dart';
import 'pages/index/index.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: IndexPage(),
      routes: staticRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
