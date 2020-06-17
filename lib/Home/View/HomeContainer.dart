import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/CarouselHome.dart';
import '../../MainComponents/View/MainContainer.dart';
import 'Components/VerticalContents.dart';



class HomeContainer extends StatefulWidget{
  final Destination destination;
  final String appName;

  const HomeContainer({Key key, this.destination, this.appName}) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {

  int numberItems = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.appName),
          actions: <Widget>[
            CupertinoButton(
              child: Badge(
                badgeContent: Text(numberItems <=99 ? "$numberItems": "+99", style: TextStyle(color: Colors.white, fontSize: 9),),
                child: Icon(Icons.shopping_cart, color: Colors.white,),
                animationType: BadgeAnimationType.scale	,
              ),
              onPressed: deleteAll,
            )
          ],
        ),
        body: Container(
          child:  ListView(
            children: [
              CarouselHome(),
              _header(context, title: "Categorías", buttonTitle: "Más categoríaas", buttonAction: (){ Navigator.pushNamed(context, "/next");}),
              SizedBox(
                height: 100,
                child: VerticalContents(),
              ),
              _header(context, title: "Frutas y verduras", buttonTitle: "Ver más", buttonAction: (){Navigator.pushNamed(context, "/next");}),
              SizedBox(
                  height: 250,
                  child: _items(context)

              ),
              _header(context, title: "Congelados", buttonTitle: "Ver más", buttonAction: (){Navigator.pushNamed(context, "/next");}),
              SizedBox(
                  height: 250,
                  child: _items(context)

              ),
              _header(context, title: "Abarrotes", buttonTitle: "Ver más", buttonAction: (){Navigator.pushNamed(context, "/next");}),
              SizedBox(
                  height: 250,
                  child: _items(context)

              ),
              _header(context, title: "Salud", buttonTitle: "Ver más", buttonAction: (){Navigator.pushNamed(context, "/next");}),
              SizedBox(
                  height: 250,
                  child: _items(context)

              )



            ],
          ),
        )
    );
  }

  void addToCart(){
    setState(() {
      numberItems += 1;
    });
  }
  void deleteAll(){
    setState(() {
      numberItems = 0;
    });
  }
  Widget _header(BuildContext context, {@required String title, String buttonTitle, buttonAction: Function}){
    return ListTile(
      title: Text(title ?? "", style: boldStyle(),),
      trailing: buttonTitle != null ?CupertinoButton(
        onPressed: buttonAction,
        child: Text(buttonTitle, style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
      ) : null,
    );
  }

  Widget _items(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return  Container(
            width: 200,
            child: Card(
              child: Column(
                children: <Widget>[
                  Expanded(child: defaultImageNetwork(context,'https://underthebridge.co.uk/wp-content/uploads/2014/03/Example-main-image1.jpg')),
                  Text("Producto de ejemplo"),
                  Text("\$200"),
                  Padding(
                    child: OutlineButton(onPressed: addToCart, child: Text("Agregar al carrito", textAlign: TextAlign.center,), ),
                    padding: EdgeInsets.symmetric(vertical: 6),
                  )
                ],
              ),

            ),
        );
      },
      scrollDirection: Axis.horizontal,

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