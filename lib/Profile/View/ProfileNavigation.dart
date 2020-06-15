import 'package:flutter/material.dart';
import 'package:shopmodel/Home/View/Home.dart';

import '../../main.dart';

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
                return ProfileContainer(destination: widget.destination, appName: widget.appName,);
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


class ProfileContainer extends StatelessWidget{
  final Destination destination;
  final String appName;

  const ProfileContainer({Key key, this.destination, this.appName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Profile"),
        ),
      ),
    );
  }
}