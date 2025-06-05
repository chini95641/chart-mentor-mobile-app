import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IndexInsightsScreen extends StatefulWidget {
  @override
  _IndexInsightsScreenState createState() => _IndexInsightsScreenState();
}

class _IndexInsightsScreenState extends State<IndexInsightsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = ["Nifty 50", "Bank Nifty", "Fin Nifty", "Midcap"];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("Index Insights")),
        leading: BackButton(),
        actions: [Icon(Icons.qr_code)],
        bottom: TabBar(
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          //dividerColor: Colors.blue,
          controller: _tabController,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((_) => buildIndexContent()).toList(),
      ),
    );
  }

  Widget buildIndexContent() {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[50]),
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildChart(),
          SizedBox(height: 16),
          _buildMarketObservation(),
          SizedBox(height: 16),
          InkWell(
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "Start Paper Trading",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(color: Colors.blue[50]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Past History Data",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                _buildHistoryItem("Asian Paints Ltd", "+22%",
                    "30 May 2025, 10:45 AM", Colors.green),
                Divider(),
                _buildHistoryItem(
                    "Cipla Ltd", "+10%", "24 May 2025, 11:00 AM", Colors.green),
                Divider(),
                _buildHistoryItem("Eicher Motors Ltd", "-15%",
                    "22 May 2025, 09:45 AM", Colors.red),
                Divider(),
                _buildHistoryItem("Nestle India Ltd", "+92%",
                    "16 Apr 2025, 12:00 PM", Colors.green),
                Divider(),
                _buildHistoryItem("Hero MotoCorp Ltd", "+10%",
                    "10 Apr 2025, 09:00 AM", Colors.green),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 10, color: Colors.black54),
                    textAlign: TextAlign.right,
                  );
                },
                interval: 200, // Show every 200 points
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  const labels = ['1H', '1D', '1W', '1M', '1Y', 'YTD'];
                  if (value.toInt() >= 0 && value.toInt() < labels.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        labels[value.toInt()],
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black87),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minY: 10200,
          maxY: 11600,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 10400),
                FlSpot(1, 10800),
                FlSpot(2, 11200),
                FlSpot(3, 11000),
                FlSpot(4, 10900),
                FlSpot(5, 11100),
              ],
              isCurved: true,
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue.withOpacity(0.3)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.3),
                    Colors.blue.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: FlDotData(show: true),
              isStrokeCapRound: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketObservation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("📅 Market Observation",
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text("22 May 2025, 9:45 AM"),
        SizedBox(height: 8),
        _infoRow("Day's Range", "10,200–11,600"),
        Divider(),
        _infoRow("52Week Range", "11,200–13,500"),
        Divider(),
        _infoRow("Previous Close", "11,900"),
        Divider(),
        _infoRow("Open", "11,980"),
        Divider(),
        _infoRow("Volume", "1,70,000"),
        Divider(),
        _infoRow("Avg Volume (3m)", "5,85,000"),
        Divider(),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value)],
      ),
    );
  }

  Widget _buildHistoryItem(
      String title, String percent, String time, Color color) {
    return ListTile(
      shape: Border.all(),
      contentPadding: EdgeInsets.all(2),
      title: Text(title),
      subtitle: Text(time),
      trailing: Text(percent,
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }
}
