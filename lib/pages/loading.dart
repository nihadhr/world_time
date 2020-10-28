import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/services/WorldTime.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void SetThingsUp() async{

    WorldTime obj=new WorldTime(location:'Sarajevo',url: 'Europe/Sarajevo');
    await obj.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':obj.location,
      'time':obj.time,
      'isday':obj.isday,
    });

  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    SetThingsUp();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey[300],
      body:Center(
        child:
            Column(
              children: <Widget>[
                SizedBox(height:400),
                Text("loading",style: TextStyle(color: Colors.black,fontSize: 20,letterSpacing: 2),),

              ],
            ),


      ),

    );
  }
}
