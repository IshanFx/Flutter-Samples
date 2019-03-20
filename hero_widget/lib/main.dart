import 'package:flutter/material.dart';
import 'second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("sss"),
      ),
      body: Center(
        
        child: Container(
          width: 100,
          child: Hero(
            tag: "flutter",
            child: GestureDetector(
              child: Image.network('https://cdn.mos.cms.futurecdn.net/WKs5S36QtRjM5ESezVRZ3d.jpg'),
              onTap: (){
                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Second()),
                          );
              },
            )
          ),
        ),
      ),
    );
  }

}

