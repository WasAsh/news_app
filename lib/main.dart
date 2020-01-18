import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app/utils/app_theme.dart';


main() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen ;
  if(seen == null || seen == false){
    _screen = WelcomeScreen() ;
  }else{
    _screen = HomeScreen() ;
  }


  runApp(NewsApp(_screen)) ;
}

class NewsApp extends StatelessWidget {

  final Widget _screen ;
  NewsApp(this._screen) ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: this._screen ,
      theme: AppTheme.appTheme ,
    );
  }
}
