import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.0,
        child: Carousel(
          images: [
            defaultImageNetwork(context, "https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg"),
            defaultImageNetwork(context, "https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg"),
            defaultImageNetwork(context, "https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg"),
            defaultImageNetwork(context, "https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg"),
          ],
          dotSize: 5,
          dotSpacing: 20,
          dotBgColor: Colors.transparent,
          dotColor: Colors.grey,
          dotIncreasedColor: Colors.blue
        )
    );
  }
  Widget _carouselImage(BuildContext context){
    return CachedNetworkImage(
      imageUrl: 'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
}

}

Widget defaultImageNetwork(BuildContext context, String imageURL){
  return CachedNetworkImage(
    imageUrl: imageURL,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}