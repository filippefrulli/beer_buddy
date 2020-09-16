import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detectPage.dart';
import 'fadeInTransition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/beer_icon.webp'),
              ),
            ),
            SizedBox(
              height: 128,
            ),
            Center(
              child: Container(
                height: 60,
                width: 220,
                child: RaisedButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      FadeInTransition(
                        builder: (context) => DetectPage(),
                      ),
                    );
                  },
                  child: Text(
                    ("Detect"),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Center(
              child: Container(
                height: 40,
                width: 160,
                child: RaisedButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      FadeInTransition(
                        builder: (context) => DetectPage(),
                      ),
                    );
                  },
                  child: Text(
                    ("Enter manually"),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
