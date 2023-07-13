import 'package:flutter/material.dart';

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
      backgroundColor: const Color.fromARGB(255, 43, 6, 3),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                    icon: const Icon(Icons.edit_location_alt),
                    label: const Text('Zmień Lokalizacje'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        dane['name'],
                        style: const TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                    const SizedBox(height: 5),
                  Text(
                    '${dane['temperatureC']}',
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   const SizedBox(height: 5),
                  Text(
                    '${dane['wind']}',
                    style: const TextStyle(
                      fontSize: 37,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    
                    '${dane['humidity']}',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   const SizedBox(height: 5),
                  Text(
                    '${dane['last']}',
                    style: const TextStyle(
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
                      dane['temperatureF'] = result['temperatureF'];
                       dane['pressure'] = result['pressure'];
                        dane['cloud'] = result['cloud'];
                         dane['winddir'] = result['winddir'];
                          dane['precip'] = result['precip'];
                           dane['uv'] = result['uv'];
                            dane['humidity'] = result['humidity'];
                     });
                       }
                        },
                    icon: const Icon(Icons.visibility_sharp),
                    label: const Text('Więcej Danych'),
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
