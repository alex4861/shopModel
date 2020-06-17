import 'package:flutter/material.dart';
import 'package:shopmodel/MainComponents/View/MainContainer.dart';

import '../../main.dart';
import 'HomeContainer.dart';

class HomeNavigation extends StatefulWidget{

  final Destination destination;
  final String appName;
  final VoidCallback onNavigation;
  final Key navigatorKey;

  const HomeNavigation({Key key, this.destination, this.appName, this.onNavigation, this.navigatorKey}) : assert(appName != null);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Navigator(
      key: widget.navigatorKey,
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch(settings.name){
              case '/':
                return HomeContainer(destination: widget.destination, appName: widget.appName,);
              case '/next':
                return NavigationFinish(destination: widget.destination);
            }
            return null;
          },
        );
      },
    );
  }
}