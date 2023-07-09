import 'package:pogoda/Home.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WeatherWorld{
    String url;
    String? temperatureC;
    String? temperatureF;
    String? name;
    String? last;
    String? wind;
    String? icon;
    


WeatherWorld({required this.url,});

 Future <void> getWeather() async{

   Response response = await get(Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=77bb211984fa4cd1a01195154230607 &q=$url&days=5&aqi=yes&alerts=no'),);
   
     Map dataa = json.decode(response.body);
    // print (dataa);

      if (dataa.containsKey('current')) {
    Map<String, dynamic> currentData = dataa['current'];
      double tempC = currentData['temp_c'];
      double tempF = currentData['temp_f'];
      double windkph = currentData['wind_kph'];
      String lastupd = currentData['last_updated'];
        temperatureC = ('$tempC''℃').toString();
         temperatureF = ('$tempF''°F').toString();
          last = ('Ostatnia aktualizacja: ''$lastupd');
           wind = ('Wiatr: ''$windkph'' km/h').toString();
              Map<String, dynamic> conditionData = currentData['condition'];
            String iconn = conditionData['icon'];
             icon = ('https:''$iconn');
            print(icon);   
      }
      
          if (dataa.containsKey('location')){
             Map<String, dynamic> locationData = dataa['location'];
            String namecity = locationData['name'];
            name = namecity; 
         }


             //  Map<String, dynamic> conditionData = currentData['condition'];
            // String iconn = conditionData['text'];
            //  icon = iconn;
            // // print(icon);   
    }
 }