import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beer Detector',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => HomePage(),
      },
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[600],
        primaryColorLight: Colors.lightBlue,
        accentColor: Colors.yellow[800],
        fontFamily: 'Raleway',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(
            //Initials in peoplePage
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: Colors.grey[500],
            letterSpacing: 5,
          ),
          headline2: TextStyle(
            //Director, composer & cast title in movieInfo |
            fontSize: 24.0,
            color: Colors.grey[800],
            fontWeight: FontWeight.w800,
          ),
          headline3: TextStyle(
            //huge text for actor name in card
            fontSize: 24.0,
            color: Colors.grey[100],
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
          ),
          headline4: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
          headline5: TextStyle(
            //Scores in MoviePage | score in viewings in movieInfoPage
            fontSize: 20.0,
            fontFamily: 'Roboto',
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          headline6: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
          subtitle1: TextStyle(
            //Description of movie plot in movieInfo | biography of people in peopleInfoPage
            fontSize: 15.0,
            color: Colors.grey[200],
          ),
          subtitle2: TextStyle(
            //Subtitle in MoviePage | subtitle text in PeoplePage | no internet text
            fontSize: 15.0,
            color: Colors.grey[500],
          ),
          bodyText1: TextStyle(
            // Ascending & Descending ^ ORDER BY in SlidingUpPanel MoviePage |
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.grey[300],
          ),
          bodyText2: TextStyle(
            //Buttons in SlidingUpPanel MoviePage |
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
          overline: TextStyle(
            // Numbers in subtitle of PeoplePage |
            letterSpacing: 0,
            fontSize: 15.0,
            fontFamily: 'Roboto',
            color: Colors.grey[500],
            fontWeight: FontWeight.w600,
          ),
          caption: TextStyle(
            //Initials in peoplePage
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.grey[500],
            letterSpacing: 3,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
