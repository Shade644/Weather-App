import 'package:flutter/material.dart';
import 'package:pogoda/weather.dart';


class Location extends StatefulWidget {
   const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

    List<WeatherWorld> city = [
    WeatherWorld(url: 'Krakow  Poland',),
	  WeatherWorld(url: 'Warsaw  Poland',),
	  WeatherWorld(url: 'Gdansk Poland',),
	  WeatherWorld(url: 'Wroclaw Poland',),
	  WeatherWorld(url: 'Berlin Germany',),
	  WeatherWorld(url: 'Munich Germany',),
	  WeatherWorld(url: 'Paris France',),
	  WeatherWorld(url: 'Amsterdam Netherlands',),
    WeatherWorld(url: 'Brussels Belgium',),
    WeatherWorld(url: 'London UK',),
    WeatherWorld(url: 'Prague Czech',),
    WeatherWorld(url: 'Stockholm Sweden',),
    WeatherWorld(url: 'Copenhagen Denmark',),
    WeatherWorld(url: 'Helsinki Finland',),
    WeatherWorld(url: 'Zagreb Croatia',),
    WeatherWorld(url: 'Athens Greece',),
    WeatherWorld(url: 'Rome Italy',),
    WeatherWorld(url: 'Madrid Spain',),
    WeatherWorld(url: 'Lisbon Portugal',),
	  ];


void updateLocation(index) async {
  WeatherWorld instance = city[index];
  await instance.getWeather();

  // ignore: use_build_context_synchronously
  Navigator.pop(context, {
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
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 43, 6, 3),
      body: ListView.builder(
        itemCount: city.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap:() {
              updateLocation(index);
              }, 
               title: Text(city[index].url),
               tileColor: const Color.fromARGB(255, 64, 156, 67),
            ),
          );
        },
        
        ),
    );
  }
}