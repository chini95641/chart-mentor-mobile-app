import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenheight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("CHART MENTOR", style: TextStyle(color: Colors.black)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Balance Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Balance", style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 4),
                      Text("5,82,375",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue),
                    child: const Text("+ Add Balance"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Allocated Assets
            const Text("Allocated Assets",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),

            SizedBox(
              height: screenheight*.3,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                        value: 2462.2,
                        color: Colors.deepPurple,
                        title: '',
                        radius: 40),
                    PieChartSectionData(
                        value: 2374.8,
                        color: Colors.orange,
                        title: '',
                        radius: 40),
                    PieChartSectionData(
                        value: 4263.0,
                        color: Colors.cyan,
                        title: '',
                        radius: 40),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Asset List
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Asset List",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Order List →",
                    style: TextStyle(color: Colors.blue, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 12),

            _buildAssetRow("DOW J", "Dow Jones Industrial", "13,200"),
            _buildAssetRow("S&P 500", "S&P 500", "15,000"),
            _buildAssetRow("BA", "The Boeing Company", "11,450"),
            _buildAssetRow("BRK-B", "Berkshire Hathaway", "11,100"),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetRow(String symbol, String name, String value) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(symbol, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(name),
          trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        const Divider(),
      ],
    );
  }
}
