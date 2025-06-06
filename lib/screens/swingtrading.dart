import 'package:flutter/material.dart';

class SwingTradingScreen extends StatelessWidget {
  const SwingTradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Swing Trading'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          StrategyCard(
            imageUrl: 'assets/feedimages/image4.png',
            date: '15 May 2025',
            title: '3 EMA Strategy (Trailing Stop Tightening)',
            description:
                'A strategy that uses 3 exponential moving averages to identify trend alignment and trigger trades.',
          ),
          StrategyCard(
            imageUrl: 'assets/feedimages/image4.png',
            date: '06 Apr 2025 10:50AM',
            title: 'Swing High Low Detector by RV5',
            description:
                'Visual indicator that auto-detects swing highs and lows with customizable bars.',
          ),
          StrategyCard(
            imageUrl: 'assets/feedimages/image4.png',
            date: '01 Apr 2025 11:00AM',
            title: 'SOXL Trend Surge v3.0.2 – Profit-Only Runner',
            description:
                'Trend-following strategy using SOXL ETF with multi-timeframe confirmation for quick gains.',
          ),
        ],
      ),
    );
  }
}

class StrategyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;

  const StrategyCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imageUrl),
            ),
            const SizedBox(height: 8),
            Text(date,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(description, maxLines: 3, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
