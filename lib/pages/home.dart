import 'package:flutter/material.dart';
import 'package:myapp/services/world_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);

    Color bgColor = data['isDayTime'] ? Colors.white : Colors.black;
    Color textColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(

      backgroundColor: bgColor,

      body: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50,),

                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text('Your Current Location:', style: TextStyle(color: textColor, fontSize: 20)),
                ),

                SizedBox(height: 75,),

                Container(
                    child: Text(data['location'], style: TextStyle(color: textColor, fontSize: 35),),
                    alignment: Alignment.bottomCenter,
                  ),

                SizedBox(height: 20,),

                Expanded(
                  child: Container(
                    child: Text(data['time'], style: TextStyle(color: textColor, fontSize: 50),),
                    alignment: Alignment.topCenter,
                  ),
                ),

                SizedBox(height: 50,),

                Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.grey[800],
                  child: TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'url': result['url'],
                        'isDayTime': result['isDayTime']
                        };
                      }
                    );
                  },

                  icon: Icon(Icons.edit_location, color: Colors.white,),
                  label: Text('Edit Location', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
