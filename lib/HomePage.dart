
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{

  const HomePage({Key? key}):super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    String title = "custom widget";

    return Scaffold(
        appBar: AppBar(

          title: Text(title),
        ),
        body: Container(
          child: Column(
            children: [ const CatItems(), const contact(), subcat(), bottom()],
          ),
        ),
          floatingActionButton: const FloatingActionButton(
          onPressed: fetch_user,
    child: Icon(Icons.add),)

    );
  }
}

class CatItems extends StatelessWidget{
  const CatItems({super.key});

  @override
  Widget build(BuildContext context){
    return Expanded(

        flex: 1,
        child: Container(
          height: 200,
          //color: Colors.red[50],
          child: ListView.builder(itemBuilder: (context, index) =>const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              //width: 100,
              child: CircleAvatar(
                backgroundColor: Colors.black12,
              ),
            ),
          ),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        )
    );
  }
}

class contact extends StatelessWidget{
  const contact({super.key});

  @override
  Widget build(BuildContext context){
    return Expanded(
        flex: 4,
        child: Container(
         // height: 200,
          //color: Colors.red[100],
          child:ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index){
                final user = users[index];
                //print(user);
                final email = user['email'];
                final name = user['name']['first'];
                final imagUrl = user['picture']['thumbnail'];
                return ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(imagUrl)),
                  title: Text(name),
                  subtitle: Text(email),

                );
              }),




          /* ListView.builder(itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading:CircleAvatar(
                backgroundColor: Colors.black12,
              ),
              title: Text("Name"),
              subtitle: Text("mobile no"),
              trailing: Icon(Icons.delete),
            ),
          ),
            itemCount: 10,

          ),*/
        )
    );
  }
}

class subcat extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Expanded(
        flex: 2,
        child: Container(
          height: 200,
          //color: Colors.red[200],
          child: ListView.builder(itemBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.black12,
                  ),
                ),
              ),
            itemCount: 10,
            scrollDirection: Axis.horizontal,

          ),
        )
    );
  }
}

class bottom extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Expanded(
        flex: 1,
        child: Container(
          height: 50,
          //color: Colors.red[300],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 11,
              mainAxisSpacing: 11,
              children: [
                Container(
                  height: 50,
                  color : Colors.black12,
                ),
                Container(
                  height: 50,
                  color : Colors.black12,
                ),
                Container(
                  height: 50,
                  color : Colors.black12,
                ),
                Container(
                  height: 50,
                  color : Colors.black12,
                )
              ],

            ),
          ),
        )
    );
  }
}

List<dynamic> users = [];
Future<void> fetch_user() async {
  print("fetch users");
  const url = "https://randomuser.me/api/?results=10";
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);
  users = json['results'];
  print(users);
  print("fetched");
}