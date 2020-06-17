import 'package:flutter/material.dart';
import 'package:shopmodel/MainComponents/View/MainContainer.dart';

import '../../main.dart';
import 'ProfileContainer.dart';

class ProfileNavigation extends StatefulWidget{
  final Destination destination;
  final String appName;
  final VoidCallback onNavigation;
  final Key navigatorKey;

  const ProfileNavigation({Key key, this.destination, this.appName, this.onNavigation, this.navigatorKey}) : super(key: key);

  @override
  _ProfileNavigationState createState() => _ProfileNavigationState();
}

class _ProfileNavigationState extends State<ProfileNavigation> {
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
                return ProfileContainer(destination: widget.destination,);
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




class MyAccountNavigation extends StatefulWidget{
  final Destination destination;
  final String appName;
  final VoidCallback onNavigation;
  final Key navigatorKey;

  const MyAccountNavigation({Key key, this.destination, this.appName, this.onNavigation, this.navigatorKey}) : super(key: key);

  @override
  _MyAccountNavigationState createState() => _MyAccountNavigationState();
}

class _MyAccountNavigationState extends State<MyAccountNavigation> {
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
                return ProfileContainer(destination: widget.destination,);
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