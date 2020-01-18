import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //pages handler
  List<PageHandler> _pageHandler;
  ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  void _pages() {
    _pageHandler = List<PageHandler>();
    _pageHandler.add(PageHandler(Icons.ac_unit, 'assets/imgs/sasdasd.jpg',
        'Reach To World News Easily With Our App , Just Click At Start'));
    _pageHandler.add(PageHandler(Icons.error, 'assets/imgs/1.jpg',
        'Our App Produced By Waseem Ashraf Alakhras , Just Click At Start'));
    _pageHandler.add(PageHandler(Icons.star, 'assets/imgs/2.jpg',
        'Just Try Our App and U Will Enjoy Us , Just Click At Start'));
    _pageHandler.add(PageHandler(Icons.favorite_border, 'assets/imgs/3.jpg',
        'Dont Forget To Like Our Products , Just Click At Start'));
  }

  @override
  Widget build(BuildContext context) {
    _pages();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(_pageHandler[index]._images),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          _pageHandler[index]._icons,
                          size: 150,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -100),
                      ),
                      Text(
                        'Welcome!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 48, left: 48, top: 18),
                        child: Text(
                          _pageHandler[index]._texts,
                          style: TextStyle(color: Colors.yellow, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: _pageHandler.length,
            onPageChanged: (index) {
              _valueNotifier.value = index;
            },
          ),
          Transform.translate(
            offset: Offset(0, 150),
            child: Align(
              alignment: Alignment.center,
              child: _pageIndicator(_pageHandler.length),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 15,
                left: 10,
                right: 10,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  child: Text(
                    'Start!',
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 1),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          _updateSeenScreen() ;
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  color: Colors.red.shade800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _valueNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }
}

void _updateSeenScreen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance() ;
  prefs.setBool('seen', true) ;
}

class PageHandler {
  IconData _icons;
  String _images;
  String _texts;

  PageHandler(this._icons, this._images, this._texts);

  String get texts => _texts;

  String get images => _images;

  IconData get icons => _icons;
}
