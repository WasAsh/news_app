import 'package:flutter/material.dart';
import 'package:news_app/sharedUI/nav_drawer.dart';
import 'homeTaps/popular.dart';
import 'homeTaps/whats_new.dart';
import 'homeTaps/favourites.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopUpMenu{
  Help , About , Settings
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          _popUpMenu(context),
        ],
        bottom: TabBar(
          tabs: [
            Tab(
              text: 'WHATS NEW',
            ),
            Tab(
              text: 'POPULAR',
            ),
            Tab(
              text: 'FAVOURITES',
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white ,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          controller: _tabController ,
          children: <Widget>[
            WhatsNew() ,
            Popular() ,
            Favourites() ,
          ],
        ),
      ),
    );
  }

  Widget _popUpMenu(BuildContext context) {
    return PopupMenuButton<PopUpMenu>(
      itemBuilder: (context){
        return [
          PopupMenuItem<PopUpMenu>(
            value: PopUpMenu.Help,
              child: Text('Help'),
          ),
          PopupMenuItem<PopUpMenu>(
            value: PopUpMenu.About,
            child: Text('About'),
          ),
          PopupMenuItem<PopUpMenu>(
            value: PopUpMenu.Settings,
            child: Text('Settings'),
          ),
        ];
      },
      onSelected: (PopUpMenu menu){

      } ,
      icon: Icon(Icons.more_vert),
    );
  }

}
