import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'sh.png', url: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'gr.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Berlin', flag: 'de.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Istanbul', flag: 'tr.png', url: 'Europe/Istanbul'),
    WorldTime(location: 'Cairo', flag: 'eg.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'ke.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'us.png', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'us.png', url: 'America/New_York'),
    WorldTime(location: 'Puerto Rico', flag: 'pr.png', url: 'America/Puerto_Rico'),
    WorldTime(location: 'Seoul', flag: 'kr.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'id.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Kolkata', flag: 'in.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Sydney', flag: 'au.png', url: 'Australia/Sydney'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              color: Colors.blue[100],
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
