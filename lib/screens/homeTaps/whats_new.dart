import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdates(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage('assets/imgs/placeholder.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 48, right: 48),
              child: Text(
                'Hello',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 34, right: 34),
              child: Text(
                'This is subtitle for this image',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: _drawSectionTitle('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  _drawSingleTopStoriesCard(),
                  _drawSingleTopStoriesDivider(),
                  _drawSingleTopStoriesCard(),
                  _drawSingleTopStoriesDivider(),
                  _drawSingleTopStoriesCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdates() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16, left: 20),
            child: _drawSectionTitle('Recent Updates'),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: <Widget>[
                  _drawRecentUpdatesCard(Colors.deepOrange , 'SPORT'),
                  _drawSingleTopStoriesDivider() ,
                  _drawRecentUpdatesCard(Colors.green , 'LIFES STYLE'),
                  SizedBox(height: 40,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdatesCard(Color color , String title) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Image(
              image: ExactAssetImage('assets/imgs/placeholder.png'),
              fit: BoxFit.cover,
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Transform.translate(
              offset: Offset(-120, 5),
              child: Container(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  title ,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 2 , left: 12),
            child: Container(
              child: Text(
                'This is the title of single recent card This is the title of single recent card ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            margin: EdgeInsets.only(left: 13),
            child: Row(
              children: <Widget>[
                Icon(Icons.access_time , color: Colors.grey,size: 18,),
                Text('15 min' , style: TextStyle(color: Colors.grey , fontSize: 14),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawSingleTopStoriesCard() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Image(
              image: ExactAssetImage('assets/imgs/placeholder.png'),
              fit: BoxFit.cover,
            ),
            width: 124,
            height: 124,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  'This is a title for news and we will got it from api',
                  maxLines: 2,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Waseem Ashraf'),
                    Row(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        Text('15 min'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawSingleTopStoriesDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade100,
    );
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }


}
