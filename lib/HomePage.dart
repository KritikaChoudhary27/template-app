
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = "custom widget";

    return Scaffold(
        appBar: AppBar(

          title: Text(title),
        ),
        body: Container(
          child: Column(
            children: [ CatItems(), contact(), subcat(), bottom()],
          ),
        )
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
          color: Colors.red[50],
          child: ListView.builder(itemBuilder: (context, index) =>Padding(
            padding: const EdgeInsets.all(8.0),
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
          height: 200,
          color: Colors.red[100],
          child: ListView.builder(itemBuilder: (context, index) => Padding(
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

          ),
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
          color: Colors.red[200],
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
          color: Colors.red[300],
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