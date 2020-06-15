import 'package:flutter/material.dart';
import 'package:shopmodel/Home/View/Home.dart';

import 'ContainerHome.dart';

class BottomItems extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BottomItemsState();

}

class _BottomItemsState extends State{

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Inicio"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket),
        title: Text("Carro"),

      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        title: FittedBox(child: Text("Lista de deseos"),),

      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: FittedBox(child: Text("Mi cuenta"),),
      ),

    ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black45,
      type: BottomNavigationBarType.fixed,

    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });

  }


  final List<Widget> _children = [
    ContainerHome(),
    Container(),
    Container(),
    Container(),

  ];

}