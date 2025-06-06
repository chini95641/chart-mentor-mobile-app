import 'package:flutter/material.dart';
import 'topic_details.dart';

class LearnTopicsScreen extends StatelessWidget {
  const LearnTopicsScreen({super.key});

  final topics = const [
    'Price Action',
    'Technical Analysis Masterclass',
    'Chart Patterns',
    'CPR & Pivot Point & VWAP',
    'Trading Strategies',
    'Smart Money Structure',
    'Pullback Trading Master Class',
    'Swing Trading',
    'Trading Types',
    'Day Trading Strategies',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Learn Trading')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: topics.length,
        itemBuilder: (_, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(5)),
              title: Text(topics[index]),
              trailing: Icon(
                Icons.arrow_forward,
                size: 16,
                color: index == 0 ? Colors.white : Colors.grey,
              ),
              tileColor: index == 0 ? Colors.blue : null,
              textColor: index == 0 ? Colors.white : null,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TopicDetailScreen(title: topics[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
