import 'package:flutter/material.dart';
import 'swingtrading.dart';

class LongTermScreen extends StatelessWidget {
  const LongTermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Long-term Investment'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          StrategyCard(
            imageUrl: 'assets/feedimages/image4.png',
            date: '15 May 2025 05:44PM',
            title: 'SPDR Portfolio Long Term Treasury',
            description:
                'A low-risk option for conservative investors seeking long-term government bond exposure.',
          ),
          StrategyCard(
            imageUrl: 'assets/feedimages/image4.png',
            date: '05 Apr 2025 10:50AM',
            title: 'Nippon India ETF Nifty 8-13 yr G-Sec Long Term Gilt (NTFL)',
            description:
                'Government bond ETF offering medium-term returns with adjustable entry points.',
          ),
          StrategyCard(
            imageUrl: 'assets/feedimages/image4.png',
            date: '01 Apr 2025 11:00AM',
            title: 'Harbor Long-Term Growers ETF (WINN)',
            description:
                'Balanced ETF focused on high-growth companies that compound over time.',
          ),
        ],
      ),
    );
  }
}
