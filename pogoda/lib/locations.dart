import 'package:flutter/material.dart';
import 'package:pogoda/weather.dart';
import 'dart:convert';

class Location extends StatefulWidget {
   const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

    List<WeatherWorld> city = [
    WeatherWorld(url: 'Krakow  Poland',),
	  WeatherWorld(url: 'Warsaw  Poland',),
	  WeatherWorld(url: 'Katowice Poland',),
	  WeatherWorld(url: 'Poznan Poland',),
	  WeatherWorld(url: 'Gdansk Poland',),
	  WeatherWorld(url: 'Wroclaw Poland',),
	  WeatherWorld(url: 'Bialystok Poland',),
	  WeatherWorld(url: 'Zakopane Poland',),
	  WeatherWorld(url: 'Szczecin Poland',),
    WeatherWorld(url: 'New York USA',),
	  ];


void updateLocation(index) async {
  WeatherWorld instance = city[index];
  await instance.getWeather();

  Navigator.pop(context, {
    'url': instance.url,
    'temperatureC': instance.temperatureC!,
    'temperatureF': instance.temperatureF!,
    'name': instance.name!,
    'last': instance.last!,
    'wind': instance.wind!,
    'icon': instance.icon!,
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: city.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap:() {
              updateLocation(index);
              },
               title: Text(city[index].url),
            ),
          );
        },
        
        ),


    );
  }
}