import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'talktomentor.dart'; // Make sure this file has the ChatScreen class

class Watchlist extends StatelessWidget {
  final List<Map<String, dynamic>> watchlist = [
    {
      'symbol': 'AAPL',
      'desc': 'Apple Company',
      'price': '120',
      'data':
          List.generate(20, (i) => FlSpot(i.toDouble(), 100 + i.toDouble())),
      'isUp': true
    },
    {
      'symbol': 'GOOGL',
      'desc': 'Google Alphabet',
      'price': '280',
      'data': List.generate(20, (i) => FlSpot(i.toDouble(), 90 + i.toDouble())),
      'isUp': true
    },
    {
      'symbol': 'TSLA',
      'desc': 'Tesla Company',
      'price': '1700',
      'data':
          List.generate(20, (i) => FlSpot(i.toDouble(), 100 - i.toDouble())),
      'isUp': false
    },
    {
      'symbol': 'AMZN',
      'desc': 'Amazon Company',
      'price': '1200',
      'data': List.generate(
          20, (i) => FlSpot(i.toDouble(), 100 + (i % 5).toDouble())),
      'isUp': true
    },
    {
      'symbol': 'NFLX',
      'desc': 'Netflix Company',
      'price': '2300',
      'data': List.generate(
          20, (i) => FlSpot(i.toDouble(), 95 + (i % 3).toDouble())),
      'isUp': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'CHART MENTOR',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'WatchList',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Row(children: [
                    Text("See More", style: TextStyle(color: Colors.blue)),
                    Icon(Icons.arrow_right_alt, color: Colors.blue)
                  ])),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: watchlist.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = watchlist[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['symbol'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(item['desc']),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: SizedBox(
                          height: 50,
                          child: LineChart(
                            LineChartData(
                              lineBarsData: [
                                LineChartBarData(
                                  spots: item['data'],
                                  isCurved: true,
                                  color:
                                      item['isUp'] ? Colors.green : Colors.red,
                                  barWidth: 2,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    color: (item['isUp']
                                            ? Colors.green
                                            : Colors.red)
                                        .withOpacity(0.3),
                                  ),
                                  dotData: FlDotData(show: false),
                                )
                              ],
                              titlesData: FlTitlesData(show: false),
                              gridData: FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(item['price']),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue, // Highlight selected icon
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Quotes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
          }
        },
      ),
    );
  }
}
