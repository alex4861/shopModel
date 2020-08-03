import 'package:flutter/material.dart';
import 'package:shopmodel/MainComponents/View/MainContainer.dart';
import 'package:shopmodel/MyOrders/Bloc/BlocProvider.dart';
import 'package:shopmodel/MyOrders/View/MapsNavigation.dart';
class MyOrdersContainer extends StatefulWidget{
  final Destination destination;

  const MyOrdersContainer({Key key, this.destination}) : super(key: key);
  _MyOrdersContainerState createState() => _MyOrdersContainerState();

}

class _MyOrdersContainerState extends State<MyOrdersContainer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: <Widget>[
            loadScreen(),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: MapsNavigation(),
            )
          ],
        ),
    );
  }


  Widget loadScreen(){
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 100,
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12),
                child: Text("Tu pedido llegara a las ##:##", style: TextStyle(fontSize: 20),),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: <Widget>[
                      Expanded( child: Padding( padding: EdgeInsets.symmetric(horizontal: 3), child: LinearProgressIndicator(),),),
                      Expanded( child: Padding( padding: EdgeInsets.symmetric(horizontal: 3), child: LinearProgressIndicator(value: 0,),),),
                      Expanded( child: Padding( padding: EdgeInsets.symmetric(horizontal: 3), child: LinearProgressIndicator(value: 0,),),),
                      SizedBox( width: 40, child: Padding( padding: EdgeInsets.symmetric(horizontal: 3), child: LinearProgressIndicator(value: 0,),),),

                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

}