import 'package:flutter/material.dart';
import 'CircleProgress.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Circle Progress'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CircleProgressState createState() => _CircleProgressState();
}

class _CircleProgressState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  AnimationController progressController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progressController = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0,end: 80).animate(progressController)..addListener((){
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
        child: CustomPaint(

          foregroundPainter: CircleProgress(animation.value), // this will add custom painter after child
          child: Container(
            width: 200,
            height: 200,
            child: GestureDetector(
                onTap: (){
                  if(animation.value == 80){
                    progressController.reverse();
                  }else {
                    progressController.forward();
                  }
                },
                child: Center(child: Text("${animation.value.toInt()} %",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),))),
          ),
        ),

      ),
    );
  }
}
