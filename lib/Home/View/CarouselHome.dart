import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.0,
        child: Carousel(
          images: [
            NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
            NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
            NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
            NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
          ],
          dotSize: 5,
          dotSpacing: 20,
          dotBgColor: Colors.transparent,
          dotColor: Colors.grey,
          dotIncreasedColor: Colors.blue,
        )
    );
  }

}