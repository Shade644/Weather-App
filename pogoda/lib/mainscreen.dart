import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pogoda/Home.dart';
import 'package:pogoda/weather.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    Map dane = {};
    Object? parameters;
  
 @override
  Widget build(BuildContext context) {

      Map fill_dane(){
    parameters = ModalRoute.of(context)!.settings.arguments;
    return jsonDecode(jsonEncode(parameters)) as Map;
  }

  dane = dane.isNotEmpty ? dane: fill_dane();
    return Scaffold(
      backgroundColor: Colors.blue[500],
      
   body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,0),
          child: Center(
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic  result = await Navigator.pushNamed(context, '/locations');
                    setState(() {
                     dane = {
                        'url': result['url'],
                        'temperatureC': result['temperatureC'],
                        'temperatureF': result['temperatureF'],
                        'name': result['name'],
                        'last': result['last'],
                        'wind': result['wind'],
                        'icon': result['icon'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Zmień Lokalizacje'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      dane['name'],
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  dane['temperatureC'],
                  style: TextStyle(
                      fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dane['temperatureF'],
                  style: TextStyle(
                       fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dane['wind'],
                  style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dane['last'],
                  style: TextStyle(
                       fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                  ),
                ),
                Image.network(
                  dane['icon'],
                  scale: 0.5,
                )
              ],
              ),
          ),
              ),
        ),
        ),
    );
  }
}