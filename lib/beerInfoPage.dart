import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeerInfoPage extends StatefulWidget {
  final String label;

  // In the constructor, require a Movie.
  BeerInfoPage({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  _BeerInfoPageState createState() => _BeerInfoPageState();
}

class _BeerInfoPageState extends State<BeerInfoPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: Theme.of(context).accentColor,
                  size: 32.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              expandedHeight: 400.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Theme.of(context).primaryColorLight,
                  child: Padding(
                    padding: EdgeInsets.all(48),
                    child:
                        Image.asset('assets/images/' + widget.label + '.png'),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: [
              SizedBox(height: 32),
              Center(
                child: Container(
                  height: 60,
                  width: 180,
                  child: RaisedButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (Route<dynamic> route) => false);
                    },
                    child: Text(
                      ("Close"),
                      style: Theme.of(context).textTheme.headline2,
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
      ),
    );
  }
}
