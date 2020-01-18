import 'package:flutter/material.dart';
import 'package:news_app/sharedUI/nav_drawer.dart';
import 'homeTaps/favourites.dart';
import 'homeTaps/popular.dart';


class HeadLineScreen extends StatefulWidget {
  @override
  _HeadLineScreenState createState() => _HeadLineScreenState();
}

class _HeadLineScreenState extends State<HeadLineScreen> with SingleTickerProviderStateMixin{

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
        title: Text('HeadLine News'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
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
            Favourites() ,
            Popular() ,
            Favourites() ,
          ],
        ),
      ),
    );
  }
}
