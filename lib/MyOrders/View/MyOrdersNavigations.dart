import 'package:flutter/material.dart';
import 'package:shopmodel/MainComponents/View/MainContainer.dart';
import 'package:shopmodel/MyOrders/View/MyOrdersContainer.dart';

import '../../main.dart';

class MyOrdersNavigation extends StatefulWidget{
  final Destination destination;
  final String appName;
  final VoidCallback onNavigation;
  final Key navigatorKey;

  const MyOrdersNavigation({Key key, this.destination, this.appName, this.onNavigation, this.navigatorKey}) : super(key: key);

  @override
  _MyOrdersNavigationState createState() => _MyOrdersNavigationState();
}

class _MyOrdersNavigationState extends State<MyOrdersNavigation> {
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
                return MyOrdersContainer(destination: widget.destination,);
              case '/next':
                return Container();
            }
            return null;
          },
        );
      },
    );
  }
}