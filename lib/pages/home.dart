import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;

    return Scaffold(

       body:Center(
         child:
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[


           Text(data["location"].toString().toUpperCase(),style:TextStyle(fontSize: 20,letterSpacing: 2)),
           Text(data["time"],style:TextStyle(fontSize: 20)),

         ],
       ),

       ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          dynamic result=await Navigator.pushNamed(context, '/location');
          setState(() {
            data={
              'time':result['time'],
              'location':result['location'],
              'isday':result['isday']
            };
          });
          },
        backgroundColor: Colors.black,
        child:
        Icon(Icons.edit_location,color: Colors.white),
      ),
    );
  }
}
