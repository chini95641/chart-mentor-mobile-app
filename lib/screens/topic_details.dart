import 'package:flutter/material.dart';

class TopicDetailScreen extends StatelessWidget {
  final String title;
  const TopicDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, centerTitle: true, title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "HOW TO STUDY CANDLESTICK IN TRADING",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              "What is a candlestick?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Candlesticks reflect what buyers/sellers are doing. They show direction, strength, and reversals.",
            ),
            SizedBox(height: 12),
            Image(
              image: NetworkImage('https://via.placeholder.com/400x180'),
            ),
            SizedBox(height: 16),
            Text("The Open:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "Open price is the first price of the day and reflects market sentiment.",
            ),
            SizedBox(height: 12),
            Text("The High:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "The high is the highest point price reaches during a session.",
            ),
            SizedBox(height: 12),
            Text("The Low:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "The lowest traded price. Bears push it down, showing weakness.",
            ),
          ],
        ),
      ),
    );
  }
}
