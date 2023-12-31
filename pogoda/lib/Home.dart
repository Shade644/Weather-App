import 'package:flutter/material.dart';
import 'package:pogoda/weather.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  
}

class _HomeState extends State<Home> {    

 void setupWeather() async{
  WeatherWorld instance = WeatherWorld(url:'Krakow Poland',);
  await instance.getWeather();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/main', arguments:{
    'url': instance.url,
    'temperatureC': instance.temperatureC!,
      'name': instance.name!,
      'last': instance.last!,
      'wind': instance.wind!,
      'icon': instance.icon!,
      'humidity': instance.humidity!,

      'temperatureF': instance.temperatureF!,
      'pressure': instance.pressure!,
      'cloud': instance.cloud!,
      'winddir': instance.winddir!,
      'precip': instance.precip!,
      'uv': instance.uv!,
      'windgust': instance.windgust!,




  },);
 }
 @override
  void initState(){
    setupWeather();
  super.initState();
 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
    body: Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.white,
        size: 200,
      ),
    ),
      );
  }
}