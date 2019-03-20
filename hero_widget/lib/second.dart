import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Container(
          child: Hero(
            tag: "flutter",
            child: Image.network('https://cdn.mos.cms.futurecdn.net/WKs5S36QtRjM5ESezVRZ3d.jpg'),
          ))

      ),
    );
  }
}
