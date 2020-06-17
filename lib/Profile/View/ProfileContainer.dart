import 'package:flutter/material.dart';
import 'package:shopmodel/MainComponents/View/MainContainer.dart';

class ProfileContainer extends StatelessWidget{
  final Destination destination;
  const ProfileContainer({Key key, this.destination});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: FittedBox(
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Icon(Icons.account_circle),
          ),
        ),
        title: Text(" Hola username!"),
        titleSpacing: 0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _item(context, title: "Mi cuenta", icon: Icons.settings, action: (){
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (BuildContext context) => MyAccount()));
            }),
            _item(context, title: "Pedidos", icon: Icons.playlist_add_check),
            _item(context, title: "Formas de pago", icon: Icons.payment),
            _item(context, title: "Direcciones", icon: Icons.local_shipping),
            _item(context, title: "Cerrar sesión", icon: Icons.exit_to_app),


          ],
        ),
      ),
    );
  }


  Widget _item (BuildContext context,{double paddingTop = 6, double paddingBottom = 0, String title, bool withContextualMenu = true, IconData icon, Function action}){
    return Padding(
      padding: EdgeInsets.only(left: 6, right: 6, top: paddingTop, bottom: paddingBottom),
      child: Card(
        child: ListTile(
          title: Text(title),
          leading: icon != null ? Icon(icon, color: Theme.of(context).accentColor,): null,
          trailing:withContextualMenu ?  Icon(Icons.keyboard_arrow_right): null,
          onTap: action,
        ),
      ),
    );
  }
}


class MyAccount extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Mi cuenta"), centerTitle: true,),
      body: Container(),
    );
  }

}
