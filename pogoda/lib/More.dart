import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final Map<String, dynamic>? data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;


    String name = data?['name'] ?? '';
    String temperatureF = data?['temperatureF'] ?? '';
   String pressure = data?['pressure'] ?? '';
   String cloud = data?['cloud'] ?? '';
   String winddir = data?['winddir'] ?? '';
   String precip = data?['precip'] ?? '';
   String uv = data?['uv'] ?? '';
    String windgust = data?['windgust'] ?? '';
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Więcej Danych'),
        backgroundColor: Color.fromARGB(255, 43, 6, 3),
        elevation: 0.5,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit:BoxFit.cover,
          )
        ),
                  child: Padding(
                     padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          precip,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(height: 10),
                    Text(
                       cloud,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 10),
                    Text(
                      pressure,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 10),
                    Text(
                      winddir,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 10),
                    Text(
                      windgust,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 10),
                    Text(
                      uv,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 10),
                     Text(
                      temperatureF,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      ],
                                ),
                  ),
                      ),
    );
      
  }
}