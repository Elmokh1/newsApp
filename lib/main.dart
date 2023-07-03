
import 'package:flutter/material.dart';
import 'package:news_app_route/pages/home_page/home_view.dart';
import 'package:news_app_route/pages/splash_page/splash_view.dart';
import 'package:news_app_route/shared_componnant/theme/my_theme.dart';

void main(){
  runApp(Myapp());
}




class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute:splash_view.routeName ,
      theme: MyTheme.lightTheme,
      routes: {
        splash_view.routeName:(context) => splash_view(),
        home_view.routename:(context) => home_view(),
      },
    );
  }
}
