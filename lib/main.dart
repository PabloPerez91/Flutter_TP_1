import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart' ;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Accueil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter >= 10) _message(context);
    });
  }

  void _decrementCount() {
    setState(() {
      _counter--;
      if (_counter <= -10) _message_secret(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(96, 141, 155, 1), // status bar color
      ),
      backgroundColor: Colors.white,
      body: Container(
      child: Align(
      alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.all(25.0),
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(96, 141, 155, 0.6),
            border: Border.all(
                color: Color.fromRGBO(65, 66, 79, 1),
                width: 4.0,
                style: BorderStyle.solid), //Border.all
            /*** The BorderRadius widget  is here ***/
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ), //BorderRadius.all
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  width: 100,
                  child : FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: _decrementCount,
                  child: const Icon(Icons.remove,size:30),
                ),
                ),
                const SizedBox(width: 30),
                Text(
                  '$_counter',
                  style: TextStyle(fontSize: 35,color: Colors.white),
                ),
                const SizedBox(width: 30),
                SizedBox(
                  height: 70,
                  width: 100,
                  child : FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add,size:30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _message(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page_Message()));
}
void _message_secret(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page_Message_Secret()));
}

class Page_Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message')),
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 150.0,
            margin: const EdgeInsets.all(25.0),
            padding: const EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Color.fromRGBO(65, 66, 79, 1),
                  width: 4.0,
                  style: BorderStyle.solid), //Border.all
              /*** The BorderRadius widget  is here ***/
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ), //BorderRadius.all
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
            SizedBox(
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Hello World',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                    ColorizeAnimatedText(
                      'Victoire',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                    ColorizeAnimatedText(
                      '+ 10 Points',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 100,
                  child : FloatingActionButton(
                    backgroundColor: Colors.lightBlue,
                    onPressed: () => _accueil(context),
                    child: const Icon(Icons.arrow_circle_left_outlined,size:60),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _accueil(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
  }
  static const colorizeTextStyle = TextStyle(
    fontSize: 40.0,
  );
  List<MaterialColor> colorizeColors = [
    Colors.cyan,
    Colors.blue,
    Colors.pink,
  ];
}


class Page_Message_Secret extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Message Secret'),
          backgroundColor: Colors.deepOrangeAccent, // status bar color
      ),
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 150.0,
            width: 420.0,
            decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(
                  color: Color.fromRGBO(72, 72, 72, 1),
                  width: 4.0,
                  style: BorderStyle.solid), //Border.all
              /*** The BorderRadius widget  is here ***/
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ), //BorderRadius.all
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 30),
                const Text(
                  'HELLO',
                  style: TextStyle(fontSize: 40.0,color: Colors.white),
                ),
                const SizedBox(width: 15.0, height: 100.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      RotateAnimatedText('SECRET'),
                      RotateAnimatedText('WORLD'),
                    ]
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 100,
                  child : FloatingActionButton(
                    backgroundColor: Colors.orangeAccent,
                    onPressed: () => _accueil(context),
                    child: const Icon(Icons.arrow_circle_left_outlined,size:60),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _accueil(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
  }
}