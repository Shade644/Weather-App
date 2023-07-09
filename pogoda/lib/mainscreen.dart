import 'package:flutter/material.dart';
import 'package:pogoda/weather.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map<String, dynamic> dane = {};

 @override
void didChangeDependencies() {
  super.didChangeDependencies();
  Map<String, dynamic>? receivedData =
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  if (receivedData != null) {
    setState(() {
      dane = receivedData;
    });
  }
}

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/locations');
                      setState(() {
                        dane = result ?? {};
                      });
                    },
                    icon: Icon(Icons.edit_location_alt),
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
                    '${dane['temperatureC']}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${dane['temperatureF']}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${dane['wind']}',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${dane['last']}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.network(
                    dane['icon'],
                    scale: 0.5,
                  ),
                  TextButton.icon(
                 onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, '/more', arguments: dane);
                    if (result != null) {
                    setState(() {
                      dane['name'] = result['name'];
                     });
                       }
                        },
                    icon: Icon(Icons.visibility_sharp),
                    label: Text('Więcej Danych'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
