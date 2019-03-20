import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Snackbar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Snackbar"),
          ),
          body: Builder(
            builder: (context) => Center(
                  child: RaisedButton(
                    child: Text("Show Snackbar"),
                    onPressed: () {
                      _showSnackbar(context);
                    },
                  ),
                ),
          ),
        ));
  }

  void _showSnackbar(BuildContext context) {
    final scaff = Scaffold.of(context);
    scaff.showSnackBar(SnackBar(
      content: Text("Hay this is it"),
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'UNDO', 
        onPressed: scaff.hideCurrentSnackBar,
      ),
    ));
  }
}
