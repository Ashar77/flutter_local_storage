import 'package:flutter/material.dart';
import 'package:local_storage/screens/home_screen.dart';
import 'package:local_storage/screens/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        ListScreen.routeName: (ctx) => ListScreen(),
      },
    );
  }
}
