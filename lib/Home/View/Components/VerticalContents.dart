import 'package:flutter/material.dart';

import 'CarouselHome.dart';

class VerticalContents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) => _buildCard(context, index),
      scrollDirection: Axis.horizontal,

    );
  }

  Widget _buildCard(BuildContext context, int index) {

    return Container(
      width: 100,
      child: Card(
        margin: EdgeInsets.only(left: 2,right: 2,top: 0, bottom: 2),
        child: FittedBox(
          child: defaultImageNetwork(context,'https://underthebridge.co.uk/wp-content/uploads/2014/03/Example-main-image1.jpg'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

}



TextStyle boldStyle(){
  return TextStyle(
    fontWeight: FontWeight.w600,
  );
}
