import 'package:flutter/material.dart';
import 'package:my_milton/screens/home.dart';
import 'screens/schedule/schedule.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HomeWrapper(),
        ),
      ),
    );
  }
}
