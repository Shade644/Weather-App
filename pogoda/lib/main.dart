import 'package:flutter/material.dart';
import 'package:pogoda/Home.dart';
import 'package:pogoda/More.dart';
import 'package:pogoda/locations.dart';
import 'package:pogoda/mainscreen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => const Home(),
     '/main':(context) => const MainScreen(),
     '/locations':(context) => const Location(),
     '/more':(context) => MoreInfo(),
  },
));