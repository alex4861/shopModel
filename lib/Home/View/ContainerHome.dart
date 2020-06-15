import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'AppBarHome.dart';
import 'CarouselHome.dart';
import 'Home.dart';
import 'VerticalContents.dart';

class ContainerHome extends StatefulWidget{

  final Destination destination;
  final String appName;
  final VoidCallback onNavigation;
  final Key navigatorKey;

  const ContainerHome({Key key, this.destination, this.appName, this.onNavigation, this.navigatorKey}) : super(key: key);

  @override
  _ContainerHomeState createState() => _ContainerHomeState();
}

class _ContainerHomeState extends State<ContainerHome> {
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
                return Containerxd(destination: widget.destination, appName: widget.appName,);
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

class Containerxd extends StatelessWidget{
  final Destination destination;
  final String appName;

  const Containerxd({Key key, this.destination, this.appName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child:  ListView(
            children: [
              CarouselHome(),
              ListTile(
                title: Text(destination.title, style: boldStyle(),),
                trailing: CupertinoButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/next");
                  },
                  child: Text("Más categorías", style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                ),
              ),
              SizedBox(
                height: 100,
                child: VerticalContents(),
              )
            ],
          ),
        )
    );
  }

}
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