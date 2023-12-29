import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json data"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("loadJson/person.json"),
              builder: (context,snapshot) {
                var myData=json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context,int index){
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Name : "+myData[index]['name']),
                          Text("Age : "+myData[index]['age']),
                          Text("Hobby : "+myData[index]['hobby']),

                        ],
                      ),
                    );
                  },
                  itemCount: myData==null? 0:myData.length,

                );
              }
          ),
        ),
      ),
    );
  }
}
