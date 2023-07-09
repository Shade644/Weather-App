import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final Map<String, dynamic>? data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;


    String name = data?['name'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Więcej Danych'),
      ),
      body: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}