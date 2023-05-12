import 'package:flutter/material.dart';
import 'package:flutter_restapi/user.dart';

class DetailPage extends StatelessWidget{

  final User user;
  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: userDetail(),
    );
  }

  userDetail(){
    return Container(
      padding: new EdgeInsets.all(32.0),
      child: 
        ListTile(
          title: Text(user.email,
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
          ),
          subtitle: Text(user.username),
          leading: Icon(Icons.email,color: Colors.purple),
        ),
    );
  }
}