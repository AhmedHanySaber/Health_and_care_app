import 'package:flutter/material.dart';

import 'chat_screen.dart';

class TreatmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tachycardia Treatment'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TreatmentCard(
              title: 'Adenosine',
              content: '''
              A dose of 6 mg of IV adenosine as a rapid IV push. Give adenosine rapidly over 1 to 3 seconds through a large (eg, antecubital) vein followed by a 20-mL saline flush and elevation of the arm. If the rate does not convert within 1 to 2 minutes, give a 12-mg bolus. Give a second 12-mg bolus if the rate fails to convert within 1 to 2 minutes after the first 12-mg bolus.
              Alternative eating:
              - Grass-fed meat
              - Pastured poultry and organ meats, such as liver or kidneys
              - Wild-caught fish and seafood, such as salmon, sardines, halibut, orange roughy, tuna, ling, pike, cod, cusk, sunfish, haddock, and whitefish
              ''',
            ),
            SizedBox(height: 16.0),
            TreatmentCard(
              title: 'Calcium Channel Blockers or β-Blocker',
              content: '''
              Verapamil:
              - Give a 2.5 to 5 mg IV bolus over 2 minutes (over 3 minutes in older patients). If there is no therapeutic response and no drug-induced adverse event, repeated doses of 5 to 10 mg may be administered every 15 to 30 minutes to a total dose of 20 mg. An alternative dosing regimen is to give a 5-mg bolus every 15 minutes to a total dose of 30 mg.
              
              Diltiazem:
              - Give a dose of 15 to 20 mg (0.25 mg/kg) IV over 2 minutes; if needed, in 15 minutes give an IV dose of 20 to 25 mg (0.35 mg/kg). The maintenance infusion dose is 5 to 15 mg/h, titrated to heart rate.
              
              Alternative eating:
              - Pulses
              - Leafy green vegetables
              - Garlic
              - Saffron
              - Low-fat dairy products
              - Bananas
              - Fish
              - Brown rice
              - Almonds
              - Peanuts
              - Cashews
              - Oat bran
              - Shredded wheat cereal
              - Soy
              - Black beans
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
