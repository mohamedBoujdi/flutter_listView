import 'package:flutter/material.dart';
import 'package:flutterapp5/details.dart';
import 'package:flutterapp5/user.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'users',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Users'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<User>> _getUsers() async {
    var data =
        await http.get(Uri.https('randomuser.me', 'api', {'results': '10'}));

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData['results']) {
      User user = User(
          u['gender'],
          u["name"]["first"] + " " + u["name"]["last"],
          u["email"],
          u["phone"],
          u["picture"]["medium"],
          u["picture"]["large"]
      );

      users.add(user);
    }
print(users);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(color: Colors.deepOrange,
                      child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[index].picSmall),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                    onTap: () {

                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },
                  ),);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
