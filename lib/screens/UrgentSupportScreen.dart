import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class UrgentSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urgent Support'),
      ),
      body: Center(
        child: Text(
          'This person has unstable heart rate and needs urgent medical support',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
