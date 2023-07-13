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
    String? humidity;
    String? pressure;
    String? cloud;
     String? winddir;
     String? precip;
    String? uv;
      String? windgust;


WeatherWorld({required this.url,});

 Future <void> getWeather() async{

   Response response = await get(Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=77bb211984fa4cd1a01195154230607 &q=$url&days=5&aqi=yes&alerts=no&Lang=pl'),);
   
     Map dataa = json.decode(response.body);
    // print (dataa);

      if (dataa.containsKey('current')) {
    Map<String, dynamic> currentData = dataa['current'];
      double tempC = currentData['temp_c'];
      double windkph = currentData['wind_kph'];
      String lastupd = currentData['last_updated'];
      int hum = currentData['humidity'];
        temperatureC = ('$tempC''℃').toString();
          last = ('Ostatnia aktualizacja: ''$lastupd');
           wind = ('Wiatr: ''$windkph'' km/h').toString();
           humidity = ('Wilgotność: ''$hum''%').toString();

              Map<String, dynamic> conditionData = currentData['condition'];
            String iconn = conditionData['icon'];
             icon = ('https:''$iconn');
            print(icon);

     double tempF = currentData['temp_f'];
    double pressuremb = currentData['pressure_mb'];
    int clouds = currentData['cloud'];
     double precipmm = currentData['precip_mm'];
      String windd = currentData['wind_dir'];
      double uvv = currentData['uv'];
      double wgust = currentData['gust_kph'];


     temperatureF = ('$tempF''°F').toString();
     pressure = ('Ciśnienie: ''$pressuremb'' hPa').toString();
     cloud = ('Zachmurzenie: ''$clouds'' %').toString();
     winddir = ('Kierunek Wiatru: ''$windd');
       precip = ('Ilość opadów ''$precipmm'' na mm/m^2').toString();
        uv = ('Index Promieniowania UV: ''$uvv').toString();
         windgust = ('Wiatr w porywach do ''$wgust'' km/h').toString();


      }
      
          if (dataa.containsKey('location')){
             Map<String, dynamic> locationData = dataa['location'];
            String namecity = locationData['name'];
            name = namecity; 
         } 
    }
 }