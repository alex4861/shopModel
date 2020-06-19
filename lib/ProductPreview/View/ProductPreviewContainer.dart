import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopmodel/Home/Model/HomeModel.dart';
import 'package:shopmodel/Home/View/Components/VerticalContents.dart';
import 'package:shopmodel/MainComponents/View/MainContainer.dart';

class ProductPreviewContainer extends StatefulWidget{

  final Destination destination;
  final ProductsData data;
  const ProductPreviewContainer({Key key, this.destination, this.data}) : super(key: key);

  @override
  _ProductPreviewContainerState createState() => _ProductPreviewContainerState();
}

class _ProductPreviewContainerState extends State<ProductPreviewContainer> {

  int numberItems = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[

          CupertinoButton(child: Icon(Icons.favorite_border, color: Colors.white,),onPressed: (){},minSize: 10, padding: EdgeInsets.all(0),),
          CupertinoButton(child: Badge(
            badgeContent: Text(numberItems <=99 ? "$numberItems": "+99", style: TextStyle(color: Colors.white, fontSize: 9),),
            child: Icon(Icons.shopping_cart, color: Colors.white,),
            animationType: BadgeAnimationType.fade	,
          ), onPressed: () {},)
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            top: 0,
            child: ListView(
              children: <Widget>[
                Container(height: 300, child: Stack( children: <Widget>[  Positioned(left: 0, top: 0, right: 0, bottom: 0, child: FittedBox( child: CachedNetworkImage(imageUrl: widget.data.image,), fit: BoxFit.cover,),), Positioned( child: CupertinoButton(child: Icon(Icons.favorite_border, color: Colors.deepPurple,), onPressed: () {},), top: 0, right: 0,)], alignment: AlignmentDirectional.center,)),
                Padding(padding: EdgeInsets.only(left: 12, right: 12, top: 12), child: Text(widget.data.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),),
                Padding(padding: EdgeInsets.only(left: 12, right: 12, top: 12), child: Text("\$ ${widget.data.price}", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),),),
                Padding(padding: EdgeInsets.only(left: 24, right: 24, top: 12), child: Text(widget.data.details, style: TextStyle( fontSize: 16),),),
                Padding(padding: EdgeInsets.only(left: 12, right: 12, top: 12), child: Text("SKU: ${widget.data.sku}", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 60,
            child: Row(
              children: <Widget>[
                optionButton(context,  title: "Agregar al carrito", icon: Icon(Icons.add_shopping_cart)),
                optionButton(context,  title: "Lista de deseos", icon: Icon(Icons.favorite_border)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget optionButton (BuildContext context, {String title, Icon icon}){
    return Expanded(
        child: Padding(
          child: MaterialButton(
            child: FittedBox(child: Row(
              children: <Widget>[
                icon,
                SizedBox(width: 8,),
                Text(title,
                    textAlign: TextAlign.center
                )],
            ),),
            onPressed: () {},
            color: Theme.of(context).accentColor,
            textColor: Colors.white, height: 80,),
          padding: EdgeInsets.all(2),
        )
    );
}
}