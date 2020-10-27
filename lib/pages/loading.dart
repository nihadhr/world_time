import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/services/WorldTime.dart';
import 'dart:async';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time="Loading..";
  String location='';
  void SetThingsUp() async{

    WorldTime obj=new WorldTime(location:'Sarajevo',url: 'Europe/Sarajevo',flag: 'smth.jpg');
    await obj.getData();
    print(obj.time);
    setState(() {
      time=obj.time;
      location=obj.location;
    });
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      SetThingsUp();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:
            Column(
              children: <Widget>[
                SizedBox(height:400),
                Text(location.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 20,letterSpacing: 2),),
                SizedBox(height:5),
                Text(time,style: TextStyle(color: Colors.black),),
              ],
            ),


      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){ Navigator.pushNamed(context, '/location');},
          backgroundColor: Colors.black,
          child:
          Icon(Icons.edit_location,color: Colors.white),
        ),
    );
  }
}
