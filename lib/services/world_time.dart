import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDaytime;
  
  WorldTime({ required this.location, required this. flag, required this.url});

  Future<void> getTime() async {
    try {
      var urli = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      var res = await http.get(urli);
      Map data = jsonDecode(res.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      String offsetMinutes = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      now = now.add(Duration(minutes: int.parse(offsetMinutes)));



      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }

    catch (e) {
      //print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}
