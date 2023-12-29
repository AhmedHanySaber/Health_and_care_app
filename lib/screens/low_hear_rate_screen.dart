import 'package:capapp/screens/treamentScreen2.dart';
import 'package:flutter/material.dart';

class LowHeartRateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Low Heart Rate'),
      ),
      body: BradycardiaTreatmentScreen(),
    );
  }
}
