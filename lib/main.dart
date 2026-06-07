import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Exercise',
      home: CounterPage(),
    );
  }
}

// A StatefulWidget is required because state changes (counter, background color)
class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  // TODO: Step 1 – Create a list of at least 5 colors
  final List<Color> colors = [
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
  ];

  // TODO: Step 2 – Add a variable to track the current background color
  Color currentColor = Colors.white;

  void _increment() {
    setState(() {
      counter++;

      // TODO: Step 3 – Update currentColor each time the counter increments
      currentColor = colors[counter % colors.length];
    });
  }

  @override
  Widget build(BuildContext context) {

    //Simple way to check if background is dark or not and change the text color
    //based on what it is. Dark backgrounds get white text, light ones get dark text
    Color textColor = ThemeData.estimateBrightnessForColor(currentColor) == Brightness.dark
      ? Colors.white
      : Colors.black;

    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(title: Text("Counter + Color Exercise")),

      body: Center(
        child: Text(
          'Count: $counter',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _increment, // Calls increment function
        child: Icon(Icons.add),
      ),
    );
  }
}