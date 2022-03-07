import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rousheta/controller.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(
          color: Color.fromRGBO(248,248,246, 1),
          padding: EdgeInsets.only(top: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [CircleAvatar(backgroundImage: AssetImage('images/unsplash_v2aKnjMbP_k.png'),radius: 30), Text('Ahmed',style: TextStyle(fontWeight: FontWeight.bold),), Text('01025424471')],),
        ),),
        Expanded(
          flex: 3,
          child: ListView.builder(shrinkWrap: true,itemCount: 6,itemBuilder: (c, i) {
            return ListTile(leading: CircleAvatar(child: Icon(Controller().icon[i]),), title: Text(Controller().drawer[i]),);
          }),),
      ],
    );
  }
}
