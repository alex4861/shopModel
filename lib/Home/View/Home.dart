import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopmodel/Home/View/AppBarHome.dart';
import 'package:shopmodel/Profile/View/ProfileNavigation.dart';
import 'BottomItems.dart';
import 'ContainerHome.dart';

class Home extends StatefulWidget{

  final String appName;

  const Home({Key key, @required this.appName}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with TickerProviderStateMixin<Home>{
  List<GlobalKey> _destinationKeys;
  List<GlobalKey<NavigatorState>> _navigatorKeys;
  List<AnimationController> _faders;
  AnimationController _hide;

  @override
  void initState() {
    super.initState();

    _faders = _children.map<AnimationController>((Destination destination) {
      return AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_selectedIndex].value = 1.0;
    _destinationKeys = List<GlobalKey>.generate(_children.length, (int index) => GlobalKey()).toList();
    _navigatorKeys = List<GlobalKey<NavigatorState>>.generate(_children.length, (int index) => GlobalKey()).toList();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }
  @override
  void dispose() {
    for (AnimationController controller in _faders)
      controller.dispose();
    _hide.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: checkWillPop,
        child: Scaffold(
          body: SafeArea(
            top: false,
            child: Stack(
              fit: StackFit.expand,
              children: _children.map((Destination destination) {
                final Widget view = FadeTransition(
                  opacity: _faders[destination.index].drive(CurveTween(curve: Curves.fastOutSlowIn)),
                  child: KeyedSubtree(
                    key: _destinationKeys[destination.index],
                    child: getContent(destination),
                  ),
                );
                if (destination.index == _selectedIndex) {
                  _faders[destination.index].forward();
                  return view;
                } else {
                  _faders[destination.index].reverse();
                  if (_faders[destination.index].isAnimating) {
                    return IgnorePointer(child: view);
                  }
                  return Offstage(child: view);
                }
              }).toList(),
            ),
          ),
          bottomNavigationBar: _bottomItems(context),
        )

    ) ;
  }


  int _selectedIndex = 0;
  Widget _bottomItems(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(items: _children.map((Destination destination) {
      return BottomNavigationBarItem(
          icon: Icon(destination.icon),
          backgroundColor: destination.color,
          title: FittedBox(child: Text(destination.title),)
      );
    }).toList(),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black45,
      type: BottomNavigationBarType.fixed,

    );
  }

  void _onItemTapped(int index, {bool isFromBack = false}){
    setState(() {
      if( Platform.isIOS){
        if(index == _selectedIndex){
          checkWillPop();
        }
      }
      _selectedIndex = index;
      if(index == 0 && isFromBack){
        final NavigatorState navigator = _navigatorKeys[_selectedIndex].currentState;
        checkWillPop();
      }
    });

  }

  Future<bool> checkWillPop() async{
    final NavigatorState navigator = _navigatorKeys[_selectedIndex].currentState;
    if (_selectedIndex != 0 && !navigator.canPop()){// if selected index isn't 0 and not can pop
      _onItemTapped(0, isFromBack: true);
      debugPrint(navigator.canPop().toString());
      return false;
    }
    else if (!navigator.canPop()) {//if is false, if not can pop
      return true;
    }
    else{
      navigator.pop();
      return false;
    }
    //else if true
  }



  final List<Destination> _children = [
    Destination('Inicio', Icons.home, Colors.teal,0, ContainerHome()),
    Destination('Carro', Icons.shopping_basket, Colors.cyan,1, Scaffold(appBar:  AppBar(),)),
    Destination('Lista de deseos', Icons.favorite, Colors.orange,2, Scaffold(appBar:  AppBar(),)),
    Destination('Mi cuenta', Icons.account_circle, Colors.blue,3, Scaffold(appBar:  AppBar(),))
  ];

  Widget getContent( Destination destination){

    switch(destination.index){
      case 0:
        return ContainerHome(
          destination: destination,
          navigatorKey: _navigatorKeys[destination.index],
          onNavigation: () {
            _hide.forward();
          },
        );
      case 1:
        return Scaffold(appBar: AppBar(),);
      case 2:
        return Scaffold(appBar: AppBar(),);
      case 3:
        return ProfileNavigation(
          destination: destination,
          navigatorKey: _navigatorKeys[destination.index],
          onNavigation: () {
            _hide.forward();
          },
        );

    }
    return null;
  }

}

class Destination {
  const Destination(this.title, this.icon, this.color, this.index, this.content);
  final String title;
  final IconData icon;
  final MaterialColor color;
  final int index;
  final Widget content;

}



