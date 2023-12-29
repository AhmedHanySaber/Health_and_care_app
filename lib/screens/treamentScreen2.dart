import 'package:flutter/material.dart';

import 'chat_screen.dart';

class BradycardiaTreatmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bradycardia Treatment'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TreatmentCard(
              title: 'Atropine',
              content: '''
              0.5 mg IV every 3 to 5 minutes to a maximum total dose of 3 mg. Doses of atropine sulfate of <0.5 mg may paradoxically result in further slowing of the heart rate.
              
              Alternative eating:
              - Fennel
              - Cloves
              - Coriander
              ''',
            ),
            SizedBox(height: 16.0),
            TreatmentCard(
              title: 'Epinephrine',
              content: '''
              0.5 mg is an initial dose.
              
              Alternative eating:
              - Coffee
              - Tea
              - Citrus fruits
              - Bananas
              - Chocolate
              - Cocoa
              - Vanilla
              ''',
            ),
            SizedBox(height: 16.0),
            TreatmentCard(
              title: 'Dopamine',
              content: '''
              Initial dose of 3 mg – 5 mg.
              
              Alternative eating:
              - Nuts and seeds
              - Vegetarian protein
              - Milk and dairy
              - Chocolates
              - Strawberries
              ''',
            ),
          ],
        ),
      ),
    );
  }
}

class TreatmentCard extends StatelessWidget {
  final String title;
  final String content;

  const TreatmentCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(content),
            SizedBox(height: 8.0),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              );
            }, child: Text('chat with chat gpt'),)
          ],
        ),
      ),
    );
  }
}
