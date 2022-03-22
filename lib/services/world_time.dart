import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String? time; // time in that location
  String? url; // url to an asset flag icon
  String? flag; // location url for api endpoint
  bool isDaytime = true;

  WorldTime({required this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //make a request
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);

      //Get properties from data
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //Create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('CAUGHT ERROR: $e');
      time = 'No Internet';
    }
  }
}
