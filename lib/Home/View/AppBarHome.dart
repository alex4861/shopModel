import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget with PreferredSizeWidget{

  final String appName;

  AppBarHome({Key key, this.appName});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Text(appName != null ? appName: ""),
      centerTitle: true,
      actions: [
        CupertinoButton(
          child: Icon(CupertinoIcons.search, color:  Colors.white,),
          onPressed: (){},
          padding: EdgeInsets.zero,
        ),
        CupertinoButton(
          child: Icon(Icons.shopping_basket, color:  Colors.white,),
          onPressed: (){},
          padding: EdgeInsets.zero,
        ),

      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);



}