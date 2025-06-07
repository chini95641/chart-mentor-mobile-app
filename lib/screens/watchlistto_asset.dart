// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class AssetDetailScreen extends StatelessWidget {
//   const AssetDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<FlSpot> priceSpots = List.generate(
//       20,
//       (i) => FlSpot(i.toDouble(), 10200 + (i % 8) * 50),
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Berkshire Hathaway INC',
//             style: TextStyle(color: Colors.black, fontSize: 16)),
//         centerTitle: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: const Row(
//               children: [
//                 Text("Order Book", style: TextStyle(color: Colors.blue)),
//                 Icon(Icons.arrow_right_alt, color: Colors.blue)
//               ],
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("11,100",
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
//               const Row(
//                 children: [
//                   Text("+306.14",
//                       style: TextStyle(color: Colors.green, fontSize: 16)),
//                   SizedBox(width: 8),
//                   Icon(Icons.arrow_drop_up, color: Colors.green),
//                   Text("Today", style: TextStyle(color: Colors.black54))
//                 ],
//               ),
//               const SizedBox(height: 10),
//               SizedBox(
//                 height: 200,
//                 child: LineChart(
//                   LineChartData(
//                     minY: 10200,
//                     maxY: 11600,
//                     titlesData: FlTitlesData(
//                       leftTitles: AxisTitles(
//                         sideTitles: SideTitles(showTitles: false),
//                       ),
//                       bottomTitles: AxisTitles(
//                         sideTitles: SideTitles(showTitles: false),
//                       ),
//                       rightTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                           showTitles: true,
//                           reservedSize: 40,
//                           getTitlesWidget: (value, meta) {
//                             const style =
//                                 TextStyle(color: Colors.black54, fontSize: 10);
//                             if (value % 200 == 0 &&
//                                 value >= 10200 &&
//                                 value <= 11600) {
//                               return Text(value.toInt().toString(),
//                                   style: style);
//                             }
//                             return const SizedBox.shrink();
//                           },
//                         ),
//                       ),
//                       topTitles: AxisTitles(
//                         sideTitles: SideTitles(showTitles: false),
//                       ),
//                     ),
//                     gridData: FlGridData(show: false),
//                     borderData: FlBorderData(show: false),
//                     lineBarsData: [
//                       LineChartBarData(
//                         spots: priceSpots,
//                         isCurved: true,
//                         color: Colors.blue,
//                         barWidth: 2,
//                         belowBarData: BarAreaData(
//                           show: true,
//                           color: Colors.blue.withOpacity(0.3),
//                         ),
//                         dotData: FlDotData(show: false),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: const [
//                   Text("1H"),
//                   Text("1D"),
//                   Text("1W",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           decoration: TextDecoration.underline)),
//                   Text("1M"),
//                   Text("1Y"),
//                   Text("YTD"),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Open"),
//                         Text("11,182",
//                             style: TextStyle(fontWeight: FontWeight.bold))
//                       ]),
//                   Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("High"),
//                         Text("11,882",
//                             style: TextStyle(fontWeight: FontWeight.bold))
//                       ]),
//                   Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Lot"),
//                         Text("131M",
//                             style: TextStyle(fontWeight: FontWeight.bold))
//                       ]),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Close"),
//                         Text("11,194",
//                             style: TextStyle(fontWeight: FontWeight.bold))
//                       ]),
//                   Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Low"),
//                         Text("10,997",
//                             style: TextStyle(fontWeight: FontWeight.bold))
//                       ]),
//                   Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Value"),
//                         Text("14,233B",
//                             style: TextStyle(fontWeight: FontWeight.bold))
//                       ]),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               const Divider(),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Other Asset",
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Row(
//                       children: [
//                         Text("See More", style: TextStyle(color: Colors.blue)),
//                         Icon(Icons.arrow_right_alt, color: Colors.blue)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               ...List.generate(2, (i) => AssetRow()),
//               const SizedBox(height: 16),
//               const Divider(),
//               const ListTile(
//                 title:
//                     Text("BA", style: TextStyle(fontWeight: FontWeight.bold)),
//                 trailing: Text("11,450",
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AssetRow extends StatelessWidget {
//   final List<FlSpot> miniData = List.generate(
//     15,
//     (i) => FlSpot(i.toDouble(), 100 + (i % 5).toDouble()),
//   );

//   AssetRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           const SizedBox(width: 8),
//           Expanded(
//             flex: 4,
//             child: SizedBox(
//               height: 50,
//               child: LineChart(
//                 LineChartData(
//                   titlesData: FlTitlesData(show: false),
//                   gridData: FlGridData(show: false),
//                   borderData: FlBorderData(show: false),
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: miniData,
//                       isCurved: true,
//                       color: Colors.green,
//                       barWidth: 2,
//                       belowBarData: BarAreaData(
//                         show: true,
//                         color: Colors.green.withOpacity(0.3),
//                       ),
//                       dotData: FlDotData(show: false),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const Expanded(
//             flex: 1,
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: Icon(Icons.check_circle_outline, color: Colors.green),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AssetDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.sizeOf(context).width;
    var heights = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Chart Mentor'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Berkshire', style: TextStyle(fontSize: 20)),
                TextButton(
                  onPressed: () {},
                  child: Text('Order Book →'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '11,100',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text('+306.14ⓘ Today',
                            style: TextStyle(color: Colors.green)),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: heights * .25,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 50,
                                interval:
                                    0.2, // Smaller interval for more labels
                                getTitlesWidget: (value, meta) {
                                  // Convert value to a more manageable scale for comparison
                                  double roundedValue =
                                      (value * 1000).round() / 1000;
                                  String text = '';
                                  // Map the chart's Y value (10.2 to 11.6) to the actual price range (10,200 to 11,600)
                                  int priceValue =
                                      (roundedValue * 1000).toInt();
                                  // Show labels at every 200 increment between 10,200 and 11,600
                                  if (priceValue >= 10200 &&
                                      priceValue <= 11600 &&
                                      priceValue % 200 == 0) {
                                    text = priceValue.toString();
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      text,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                  );
                                },
                              ),
                            ),
                            topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                          ),
                          borderData: FlBorderData(show: false),
                          minX: 0,
                          maxX: 30,
                          minY: 10.2,
                          maxY: 11.6,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 11.0),
                                FlSpot(5, 11.1),
                                FlSpot(10, 11.2),
                                FlSpot(15, 11.15),
                                FlSpot(20, 11.25),
                                FlSpot(25, 11.1),
                                FlSpot(30, 11.3),
                              ],
                              isCurved: true,
                              color: Colors.blue,
                              barWidth: 2,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: Colors.blue.withOpacity(0.3),
                              ),
                            ),
                          ],
                          lineTouchData: const LineTouchData(enabled: false),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                   SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        SizedBox(width: 8),
        TextButton(onPressed: () {}, child: Text('1H')),
        TextButton(onPressed: () {}, child: Text('1D')),
        TextButton(onPressed: () {}, child: Text('1W')),
        TextButton(onPressed: () {}, child: Text('1M')),
        TextButton(onPressed: () {}, child: Text('1Y')),
        TextButton(onPressed: () {}, child: Text('YTD')),
        SizedBox(width: 8),
      ],
    ),
  ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Open 11,182'),
                        Text('High 11,882'),
                        Text('Lot 131M'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Close 11,184'),
                        Text('Low 10,997'),
                        Text('Value 14,238B'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Other Asset',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Card(
                      color: Colors.white,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'BA',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: heights * .1,
                              width: widths * .2,
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  minX: 0,
                                  maxX: 30,
                                  minY: 11.0,
                                  maxY: 11.6,
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        FlSpot(0, 11.2),
                                        FlSpot(5, 11.3),
                                        FlSpot(10, 11.25),
                                        FlSpot(15, 11.35),
                                        FlSpot(20, 11.4),
                                        FlSpot(25, 11.45),
                                        FlSpot(30, 11.5),
                                      ],
                                      isCurved: true,
                                      color: Colors.green,
                                      barWidth: 1,
                                      dotData: const FlDotData(show: false),
                                    ),
                                  ],
                                  lineTouchData:
                                      const LineTouchData(enabled: false),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '11,450',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 16),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('SEE MORE →'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
