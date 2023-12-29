import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class RandomNumberWidget extends StatefulWidget {
  final int minNumber;
  final int maxNumber;

  RandomNumberWidget({required this.minNumber, required this.maxNumber});

  @override
  _RandomNumberWidgetState createState() => _RandomNumberWidgetState();
}

class _RandomNumberWidgetState extends State<RandomNumberWidget> {
  late int _currentNumber;
  late Random _random;

  @override
  void initState() {
    super.initState();
    _random = Random();
    _currentNumber = _generateRandomNumber();
    _startRandomNumberGenerator();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _startRandomNumberGenerator() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentNumber = _generateRandomNumber();
      });
    });
  }

  int _generateRandomNumber() {
    return widget.minNumber +
        _random.nextInt(widget.maxNumber - widget.minNumber + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Heart Rate:',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 10.0),
          Text(
            '$_currentNumber',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}