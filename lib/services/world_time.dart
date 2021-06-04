import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  late String time;
  String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.url});

  Future<void> getTime() async {
    Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

    Map data = jsonDecode(response.body);

    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'];

    String offset1 = data['utc_offset'].substring(1,3);
    String offset2 = data['utc_offset'].substring(4,6);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

    isDayTime = now.hour > 6 && now.hour < 20;

    time = DateFormat.jm().format(now);
  }
}