import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopmodel/Home/Model/HomeModel.dart';
import 'package:shopmodel/Home/ViewModel/HomeViewModel.dart';
import 'package:shopmodel/ProductPreview/View/ProductPreviewContainer.dart';
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

    return Scaffold(
        appBar: AppBar(
          title: Row(children: <Widget>[Text(widget.appName), Icon(Icons.insert_emoticon)],),
          actions: <Widget>[
            CupertinoButton(child: Icon(CupertinoIcons.search, color: Colors.white,), padding: EdgeInsets.all(0), onPressed: (){},minSize: 10,),
            CupertinoButton(
              child: Badge(
                badgeContent: Text(numberItems <=99 ? "$numberItems": "+99", style: TextStyle(color: Colors.white, fontSize: 9),),
                child: Icon(Icons.shopping_cart, color: Colors.white,),
                animationType: BadgeAnimationType.fade	,
              ),
              onPressed: deleteAll,
            )
          ],
        ),
        body: Container(
          child:  ListView(
            children: [
              CarouselHome(),

              FutureBuilder(
                future: getDepartments(),
                builder: (context, snapshot){
                  final Departments _snapshot = snapshot.data;
                  if (snapshot.hasData) {
                    List<Widget> _row = [];

                    _snapshot.dataReturn.forEach((actual){
                      _row.add(_header(context, title: actual.name, buttonTitle: "Ver más", buttonAction: (){}),);
                      _row.add(FutureBuilder(
                        future: getProductFromDepartament(departments: actual.name),
                        builder: (context, snapshot){
                          final Products _snapshot = snapshot.data;
                          if(snapshot.hasData){
                            return SizedBox(height: 250, child: _items(context, _snapshot));
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Padding( padding: EdgeInsets.all(40), child: SizedBox(height: 40, child: FittedBox( child: CircularProgressIndicator(), fit: BoxFit.fitHeight,)),);

                        },
                      ));
                    });
                    return Column(children: _row,);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // Por defecto, muestra un loading spinner
                  return Padding( padding: EdgeInsets.all(40), child: SizedBox(height: 40, child: FittedBox( child: CircularProgressIndicator(), fit: BoxFit.fitHeight,)),);

                },
              )
            ],
          ),
        )
    );
  }
  void addToCart(){
    setState(() {numberItems += 1;});
  }
  void deleteAll(){
    setState(() {numberItems = 0;});
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

  Widget _items(BuildContext context, Products data, {Function onTap}) {

    return ListView.builder(
      itemCount: data.dataReturn.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: (){
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => ProductPreviewContainer(data: data.dataReturn[index],)));
            },
            child: Container(
              width: 200,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(child: defaultImageNetwork(context, data.dataReturn[index].image)),
                    Text(data.dataReturn[index].name),
                    Text("\$ ${data.dataReturn[index].price}"),
                    Padding(
                      child: OutlineButton(onPressed: addToCart, child: Text("Agregar al carrito", textAlign: TextAlign.center,), ),
                      padding: EdgeInsets.symmetric(vertical: 6),
                    )
                  ],
                ),
              ),
            )
        );
      },
      scrollDirection: Axis.horizontal,

    );
  }
}