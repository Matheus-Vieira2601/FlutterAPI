import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_restapi/api.dart';
import 'package:flutter_restapi/detailpage.dart';
import 'package:flutter_restapi/user.dart';
import 'package:http/http.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BuildListViewState();
}

class _BuildListViewState extends State {
  List<User> users = <User>[];
  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuários"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index].name,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black
                          )
              ),
              subtitle: Text(users[index].email,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey
                            ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetailPage(users[index])));
              },
            );
          }),
    );
  }
}