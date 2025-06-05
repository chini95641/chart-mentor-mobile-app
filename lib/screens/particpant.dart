import 'package:flutter/material.dart';

class ChartMentorScreen extends StatelessWidget {
  final List<Map<String, dynamic>> participants = [
    {"name": "Adison Press", "date": "15 May 2025 04:55PM", "value": 133.70},
    {"name": "Ruben Geidt", "date": "10 May 2025 03:00PM", "value": 709.65},
    {"name": "Jakob Levin", "date": "05 Apr 2025 01:00PM", "value": 386.69},
    {"name": "Madelyn Dias", "date": "27 Mar 2025 06:00PM", "value": 29.15},
    {"name": "Zain Vaccaro", "date": "10 Feb 2025 02:00PM", "value": 44.55},
    {"name": "Skylar Geidt", "date": "08 Feb 2025 02:00PM", "value": 169.25},
    {"name": "Madelyn Dias", "date": "11 Jan 2025 06:00PM", "value": 300.00},
    {"name": "Jakob Levin", "date": "09 Jan 2025 01:00PM", "value": 122.25},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/logo/Logo.png',
                height: 25,
              ),
              Text("CHART MENTOR"),
            ],
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("NIFTY WILL CLOSE TODAY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 10),
          Text("Participants List", style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: participants.length,
              itemBuilder: (context, index) {
                final p = participants[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(p['name']),
                      subtitle: Text(p['date']),
                      trailing: Text(p['value'].toString()),
                    ),
                    Divider()
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "Activity"),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: "Learn"),
        BottomNavigationBarItem(
            icon: Icon(Icons.format_quote), label: "Quotes"),
        BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart), label: "Portfolio"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
