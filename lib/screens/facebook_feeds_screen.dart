import 'package:flutter/material.dart';
import 'package:news_app/sharedUI/nav_drawer.dart';


class FacebookFeedScreen extends StatefulWidget {
  @override
  _FacebookFeedScreenState createState() => _FacebookFeedScreenState();
}

class _FacebookFeedScreenState extends State<FacebookFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Feeds'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _cardHeader(),
                  _cardTitle(),
                  _cardHash(),
                  _cardBody(),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
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
                Text(
                  'Waseem Ashraf',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(
                  width: 4,
                ),
                SizedBox(height: 8),
                Text(
                  'Fri, 12 May 2017 . 14.38',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Colors.grey.shade400,
            ),
            Transform.translate(
              offset: Offset(-10, 0),
              child: Text(
                '25',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _cardTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8 , left: 16 , right: 16),
      child: Text(
        'We also talk about the future of work on the robots' ,
        style: TextStyle(
          color: Colors.grey.shade900 ,
        ),
      ),
    );
  }

  Widget _cardHash() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
            child: Text('#advance' , style: _customStyle,) ,
            onPressed: (){},
          ),
          FlatButton(
            child: Text('#advance' , style: _customStyle,) ,
            onPressed: (){},
          ),
          FlatButton(
            child: Text('#advance' , style: _customStyle,) ,
            onPressed: (){},
          ),
        ],
      ),
    );
  }

  Widget _cardBody() {
    return SizedBox(
      width: double.infinity ,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Image(
        image: ExactAssetImage('assets/imgs/placeholder.png' ),
        fit: BoxFit.cover ,
      ),
    );
  }

  Widget _cardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          child: Text(
            '10 Comments',
            style: _customStyle ,
          ),
          onPressed: () {},
        ),
        Row(
          children: <Widget>[
            FlatButton(
              child: Text(
                'Share',
                style: _customStyle ,
              ),
              onPressed: () {},
            ),
            FlatButton(
              child: Text(
                'Open',
                style: _customStyle ,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  TextStyle _customStyle = TextStyle(
    color: Colors.orange ,
  );


}
