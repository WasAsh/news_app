import 'package:flutter/material.dart';
import 'package:news_app/models/nav_drawer.dart';
import 'package:news_app/screens/head_line_news_screen.dart';
import 'package:news_app/screens/facebook_feeds_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/instagram_feeds_screen.dart';
import 'package:news_app/screens/twitter_feeds_screen.dart';


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  List<NavDrawer> _nav = [
    NavDrawer('Explore' , () => HomeScreen() ) ,
    NavDrawer('Headline News' , () => HeadLineScreen() ) ,
    NavDrawer('Twitter Feeds' , ()=> TwitterFeedScreen()) ,
    NavDrawer('Instagram Feeds' , ()=> InstagramFeedScreen()) ,
    NavDrawer('Facebook Feeds' , ()=> FacebookFeedScreen()) ,

  ] ;

  List<String> _menu = [
    'Explore' ,
    'Headline News' ,
    'Read Later' ,
    'Videos' ,
    'Photos' ,
    'Settings' ,
    'Logout' ,
  ] ;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 24 , top: 65),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  _nav[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context) ;
                  Navigator.push(context, MaterialPageRoute(builder: (context ){
                    return _nav[position].destination() ;
                  }));
                },
              ),
            );
          },
          itemCount: _nav.length ,
        ),
      ),
    );
  }
}
