
import 'package:flutter/material.dart';
import 'package:world_time/services/WorldTime.dart';
import 'package:world_time/services/Locations.dart';
import 'dart:convert';
import 'package:http/http.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  Future<List<dynamic>>locations;

  Future<List>InitiateData() async {
    return json.decode(
        (await get("http://worldtimeapi.org/api/timezone")).body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locations=InitiateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List>(
        future: locations,
        builder: (BuildContext context,AsyncSnapshot<List>snapshot){
            if(snapshot.data != null){
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                      return Card(
                          child: ListTile(
                              onTap: ()async{
                                WorldTime ob=new WorldTime(location:snapshot.data[index],url: snapshot.data[index]);
                                await ob.getData();
                                Navigator.pop(context,{
                                'location':ob.location,
                                  'time':ob.time,
                                'isday':ob.isday
                                  });
                                  },
                                title: Text(snapshot.data[index]),
                              ),
                            );
                          }
                      );

                    }
                      else{
                          return Center(child: CircularProgressIndicator());
                      }

      },

      ),




    );
  }
}