import 'package:flutter/material.dart';
import 'package:test_app/calender_cell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CalendarCell(
              dayNumber: 14,
              backgroundColor: Colors.red,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CalendarCell(
              dayNumber: 30,
              showBorder: true,
              borderColor: Colors.orange,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            CalendarCell(
              dayNumber: 16,
              showBorder: true,
              topLeftColor: Colors.pink,
              bottomRightColor: Colors.grey,
            ),
            CalendarCell(
              dayNumber: 15,
              backgroundColor: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
