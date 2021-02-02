import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/homescreen.dart';
import 'package:plant_app/fetchdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/listpage': (context) => FetchData(hommepageurl)
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        shadowColor: Color.fromRGBO(0, 128, 128, 1),
        primaryColor: Color.fromRGBO(0, 128, 128, 1)
      ),
      home: HomeScreen(),

    );
  }
}


