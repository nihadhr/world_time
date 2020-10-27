import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';
import 'pages/home.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      '/' : (context) => Loading(),
      '/location': (context) => ChooseLocation(),
      '/home':(context) => Home()
    },

  ));

}

