import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chartofday extends StatefulWidget {
  const Chartofday({super.key});

  @override
  State<Chartofday> createState() => _ChartofdayState();
}

class _ChartofdayState extends State<Chartofday> {
  Future<List<ChartData>> fetchCharts() async {
    final url = Uri.parse('https://test-5o8z.onrender.com/api/charts');

    final response = await http.get(
      url,
      headers: {
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxNDgyYTk1Ni1lZWU3LTRkYjMtYmZjZi1lNjIwMzc1YWI4MzgiLCJuYW1lIjoidGVzdCB0ZXN0Iiwicm9sZSI6IkFETUlOIiwiZW1haWwiOiJ0ZXN0QGdtYWlsLmNvbSIsImlhdCI6MTc0OTMwMjM0MywiZXhwIjoxNzQ5ODIwNzQzfQ.3P-Yae2j0v6jZ--fa7Nr1ZfQ5mE_EcqrXQVesnxzAkY',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    print(response.body + 'Qoutes api');
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['result'];
      return data.map((item) => ChartData.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCharts();
  }

  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.sizeOf(context).width;
    var heights = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Chart Of the Day'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //_buildChart(heights: heights * .3),
          FutureBuilder(
            future: fetchCharts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Failed to load quotes'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No quotes available'));
              }
              final chartDataList = snapshot.data as List<ChartData>;
              final chart =
                  chartDataList.first; // Use the first item for display
              print('https://test-5o8z.onrender.com/${chart.imageUrl}');
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://test-5o8z.onrender.com/${chart.imageUrl}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: heights * .3,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: double.infinity,
                          height: heights * .3,
                          color: Colors.grey[200],
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: heights * .3,
                          color: Colors.grey[200],
                          child: const Center(
                              child: Icon(Icons.broken_image,
                                  size: 50, color: Colors.grey)),
                        );
                      },
                    ),
                  ),

                  // Image.network(
                  //     'https://test-5o8z.onrender.com/${chart.imageUrl}'),
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '${chart.description}',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChart({required double heights}) {
    return Container(
      height: heights,
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
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            // rightTitles: AxisTitles(
            //   sideTitles: SideTitles(
            //     showTitles: true,
            //     reservedSize: 50,
            //     getTitlesWidget: (value, meta) {
            //       return Text(
            //         value.toInt().toString(),
            //         style: const TextStyle(fontSize: 10, color: Colors.black54),
            //         textAlign: TextAlign.right,
            //       );
            //     },
            //     interval: 200, // Show every 200 points
            //   ),
            // ),
            // bottomTitles: AxisTitles(
            //   sideTitles: SideTitles(
            //     showTitles: true,
            //     interval: 1,
            //     getTitlesWidget: (value, meta) {
            //       const labels = ['1H', '1D', '1W', '1M', '1Y', 'YTD'];
            //       if (value.toInt() >= 0 && value.toInt() < labels.length) {
            //         return Padding(
            //           padding: const EdgeInsets.only(top: 8),
            //           child: Text(
            //             labels[value.toInt()],
            //             style: const TextStyle(
            //                 fontSize: 12, color: Colors.black87),
            //           ),
            //         );
            //       } else {
            //         return const SizedBox.shrink();
            //       }
            //     },
            //   ),
            // ),
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
              barWidth: 1,
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
}

class ChartData {
  final String description;
  final String imageUrl;

  ChartData({required this.description, required this.imageUrl});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
