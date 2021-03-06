import 'package:flutter/material.dart';
import 'package:shopmodel/MainComponents/View/MainContainer.dart';

class NavigationFinish extends StatelessWidget{
  const NavigationFinish({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    const List<int> shades = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

    return Scaffold(
        backgroundColor: destination.color[50],
        appBar: AppBar(),
        extendBodyBehindAppBar: true,
        body: SizedBox.expand(
          child: ListView.builder(
            itemCount: shades.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 128,
                child: Card(
                  color: destination.color[shades[index]].withOpacity(0.25),
                  child: InkWell(
                    onTap: () {
                    },
                    child: Center(
                      child: Text('Item $index', style: Theme.of(context).primaryTextTheme.display1),
                    ),
                  ),
                ),
              );
            },
          ),
        )
    );
  }


}