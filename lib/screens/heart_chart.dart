import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chats_provider.dart';
import '../providers/models_provider.dart';
import '../widgets/random.dart';
import 'TreatmentScreen1.dart';
import 'UrgentSupportScreen.dart';
import 'chat_screen.dart';
import 'deadScreen.dart';
import 'high_rate_screen.dart';
import 'low_hear_rate_screen.dart';
import 'notification_controller.dart';

// Add necessary imports



class HeartRateMonitorScreen extends StatefulWidget {
  @override
  _HeartRateMonitorScreenState createState() => _HeartRateMonitorScreenState();
}
int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(251); // Generates a random number between 0 and 250 (exclusive)
}

class _HeartRateMonitorScreenState extends State<HeartRateMonitorScreen> {
  // DatabaseReference sensorReadingsRef =
  // FirebaseDatabase.instance.reference().child('sensor_readings');

  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    // TODO: Initialize Firebase and set up data listeners
  }
  int heartRate =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart Rate Monitor'),
        actions: [
          InkWell(child: Icon(Icons.chat,
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: databaseReference.child('Test').onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && !snapshot.hasError && snapshot.data!.snapshot.value != null) {
            dynamic data = snapshot.data!.snapshot.value;
            int heartRate = data['random_Int_Val'] ?? 0;
            
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Heart Rate: $heartRate',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (heartRate > 120 && heartRate <=170) {
                        AwesomeNotifications().createNotification(
                          content: NotificationContent(
                            id: 1,
                            channelKey: 'basic_channel',
                            title: 'High Heart Rate Alert',
                            body: 'Heart rate is elevated: $heartRate bpm',
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HighHeartRateScreen()),
                        );
                      } else  if (heartRate < 55 || heartRate > 170) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UrgentSupportScreen()),
                        );
                      }
                      else   if (heartRate < 70&&heartRate>=55) {
                        AwesomeNotifications().createNotification(
                          content: NotificationContent(
                            id: 1,
                            channelKey: 'basic_channel',
                            title: 'Low Heart Rate Alert',
                            body: 'Heart rate is elevated: $heartRate bpm',
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LowHeartRateScreen()),
                        );
                      }
                    },
                    child: Text('View Details'),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


