import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:myapp/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void SetupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata', url: 'Asia/Kolkata');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'url': instance.url,
      'isDayTime': instance.isDayTime
      }
    );
  }

  @override
  void initState() {
    super.initState();
    SetupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 35,
        //child: Text('Loading', style: TextStyle(color: Colors.white),)
        ),
      )
    );
  }
}
