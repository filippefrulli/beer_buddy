import 'package:flutter/cupertino.dart';

class FadeInTransition<T> extends CupertinoPageRoute<T> {
  FadeInTransition({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);
  @override
  bool get fullscreenDialog => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }  
}