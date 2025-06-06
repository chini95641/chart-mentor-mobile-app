import 'package:flutter/material.dart';

class PastHistoryScreen extends StatelessWidget {
  const PastHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyData = [
      {
        "company": "Asian Paints Ltd",
        "change": "+10% Gains",
        "date": "30 May 2025, 10:45 AM",
        "details": {
          "Day’s Range": "10,200–11,600",
          "52Wk Range": "11,200–13,500",
          "Previous Close": "11,980",
          "Open": "11,900",
          "Volume": "5,85,000"
        }
      },
      {
        "company": "Cipla Ltd",
        "change": "+15% Gains",
        "date": "24 May 2025, 11:00 AM",
      },
      {
        "company": "Nifty 50",
        "change": "-5% Loss",
        "date": "22 May 2025, 09:45 AM",
        "details": {
          "Day’s Range": "10,200–11,600",
          "Previous Close": "11,980",
        }
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text("Past History")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(5)),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: historyData.length,
            itemBuilder: (context, index) {
              final item = historyData[index];
              return Column(
                children: [
                  ExpansionTile(
                    tilePadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    title: Text(
                      '${item['company']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${item['date']}  •  ${item['change']}',
                      style: TextStyle(
                        color: item['change'].toString().contains('+')
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    children: (item['details'] as Map<String, String>? ?? {})
                        .entries
                        .map((entry) => ListTile(
                              dense: true,
                              title: Text('${entry.key}: ${entry.value}'),
                            ))
                        .toList(),
                  ),
                  Divider()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
