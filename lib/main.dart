import 'package:flutter/material.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/loading_screen.dart';
import 'package:myapp/pages/location.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

  initialRoute: '/',
  routes: {
    '/': (context) => LoadingScreen(),
    '/home': (context) => Home(),
    '/location': (context) => Location()
},
));



