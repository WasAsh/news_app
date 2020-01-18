import 'package:flutter/material.dart';
import 'package:news_app/sharedUI/nav_drawer.dart';

class TwitterFeedScreen extends StatefulWidget {
  @override
  _TwitterFeedScreenState createState() => _TwitterFeedScreenState();
}

class _TwitterFeedScreenState extends State<TwitterFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feeds'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  _cardHeader(),
                  _cardBody(),
                  _drawDivider(),
                  _cardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/imgs/placeholder.png'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Waseem Ashraf',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '@was_ash',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Fri, 12 May 2017 . 14.38',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 18, right: 16),
      child: Text(
        'Hey , my name is waseem ashraf alakras and i used this as a test without API ',
        style: TextStyle(height: 1.25, fontSize: 16),
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: Colors.orange,
                  size: 28,
                ),
                onPressed: () {},
              ),
              Text('25'),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Share',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text(
                  'Open',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 20),
    );
  }

}
