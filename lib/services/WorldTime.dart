import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String time;
  String location;
  String url;
  bool isday;
  WorldTime({this.location,this.url});

  Future<void> getData() async {
    try {
      Response response = await get(
          "http://worldtimeapi.org/api/timezone/" + url);
      Map parsed = jsonDecode(response.body);
      print(parsed);
      String datetime = parsed['datetime'];
      String offset = parsed['utc_offset'].substring(0, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time =
      " ${now.hour.toString()}:${now.minute
          .toString().padLeft(2, '0')} ${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day
          .toString().padLeft(2, '0')}";
    // :${now.second.toString().padLeft(2, '0')
      isday=now.hour>6 && now.hour<18;

    }
    catch(e){
      time ="Couldn't retrieve data.";

    }
  }
}


