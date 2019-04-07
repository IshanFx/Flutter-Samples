import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  
  AnimationController animationController;
  Animation<double> animation;
  int currentState = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 500),vsync: this);
    animation = Tween<double>(begin: 0,end: 60).animate(animationController)..addListener((){
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 300,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: animation.value,
                child: FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: (){},
                  child: Icon(Icons.cake)),
              ),
              Positioned(
                bottom: 0,
                
                child: FloatingActionButton(
                  onPressed: (){
                    if(currentState == 0){
                      animationController.forward();
                      currentState = 1;
                    } else{
                      animationController.reverse();
                      currentState = 0;
                    }
                  },
                  child: Icon(Icons.play_arrow)),
              )
            ],
          ),
        ),
      )
    );
  }
}
