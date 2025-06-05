import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chartofday extends StatelessWidget {
  const Chartofday({super.key});

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
          _buildChart(heights: heights * .3),
          SizedBox(
            height: 15,
          ),
          Text(
            'Swing Breakout',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black87),
                children: [
                  TextSpan(
                    text:
                        'Curabitur nulla mi, facilisis id risus eget, pellentesque consectetur augue. Phasellus volutpat tincidunt laoreet.',
                  ),
                  TextSpan(text: '\n\n'), // space between paragraphs
                  TextSpan(
                    text:
                        'Nullam eu eleifend massa. Pellentesque eu aliquet turpis, vel cursus purus.',
                  ),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                    text:
                        'Mauris et neque ex. Aenean congue iaculis velit, non mollis quam rhoncus at. Nulla facilisi.\t',
                  ),

                  TextSpan(
                      text:
                          'Pellentesque eu aliquet turpis, vel cursus purus. Mauris et neque ex. Aenean congue iaculis velit, non mollis quam rhoncus at. Nulla facilisi.\t'),

                  TextSpan(
                      text:
                          'Pellentesque eu aliquet turpis, vel cursus purus. Mauris et neque ex. Aenean congue iaculis velit, non mollis quam rhoncus at. Nulla facilisi.'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0, // Highlight "Activity"
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.timeline), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Learn"),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_quote), label: "Quotes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), label: "Portfolio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_4_outlined), label: "Profile"),
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
