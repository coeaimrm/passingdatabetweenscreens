import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenOne(),
    );
  }
}


class ScreenOne extends StatefulWidget {
  ScreenOne() : super();

  final String title = "Screen One";

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  void passToNextPage(String text) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new ScreenTwo(text)));
  }
  final TextEditingController first = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Screen One",
            ),
            TextFormField(

              controller: first,
            ),
            RaisedButton(
              child: Text("Go to Next Page"),
              onPressed: () {
                passToNextPage(first.text);
              },
            )
          ],
        ),
      ),
    );
  }
}

class ScreenTwo extends StatefulWidget {
  ScreenTwo(this.title) : super();

  final String title;

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "got a value  "+ widget.title+ "   from page1",
            ),


          ],
        ),
      ),
    );
  }
}