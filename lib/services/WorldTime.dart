import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String time;
  String location;
  String flag;
  String url;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getData() async {
    try {
      Response response = await get(
          "http://worldtimeapi.org/api/timezone/" + url);
      Map parsed = jsonDecode(response.body);
      String datetime = parsed['datetime'];
      String offset = parsed['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time =
      "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day
          .toString().padLeft(2, '0')} ${now.hour.toString()}:${now.minute
          .toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    }
    catch(e){
      time ="Couldn't retrieve data.";
    }
  }
}


