import 'package:flutter/material.dart';
import 'package:myapp/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Cairo', location: 'Cairo'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi'),
    WorldTime(url: 'America/Chicago', location: 'Chicago'),
    WorldTime(url: 'America/New_York', location: 'New York'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta'),
    WorldTime(url: 'Europe/London', location: 'London'),
    WorldTime(url: 'Europe/Athens', location: 'Athens'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Choose a Location'),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        elevation: 0,
      ),
      
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                tileColor: Colors.black,
                hoverColor: Colors.grey,
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].url, style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            );
          }
      )
    );
  }
}
