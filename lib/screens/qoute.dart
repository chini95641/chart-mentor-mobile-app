// import 'package:flutter/material.dart';

// class QuotesScreen extends StatelessWidget {
//   const QuotesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var widths = MediaQuery.sizeOf(context).width;
//     var heights = MediaQuery.sizeOf(context).height;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: const Icon(Icons.arrow_back),
//         title: const Text('Quotes'),
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           const Row(
//             children: [
//               Icon(Icons.access_time, size: 18),
//               SizedBox(width: 8),
//               Text("Friday, 17 May",
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//             ],
//           ),
//           const SizedBox(height: 4),
//           const Text("Nifty sideways, avoid entries"),
//           const SizedBox(height: 16),
//           const Text("Today's Quote",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Text('"Trade only when it’s clear"',
//                 style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
//           ),
//           const SizedBox(height: 24),
//           const Text("Popular",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 12),
//           SizedBox(
//             height: heights * .22,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 _buildPopularCard(
//                     icon: Icons.bar_chart,
//                     label: "Chart of the Day",
//                     backgroundColor: Colors.blue),
//                 const SizedBox(width: 12),
//                 _buildPopularCard(
//                     icon: Icons.play_circle_outline,
//                     label: "New Learning Video",
//                     backgroundColor: Colors.grey[200]!),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           const Text("Recent Updates",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 12),
//           _buildUpdateCard(
//               imageUrl: " ",
//               title: "Market don't care about your hopes",
//               subtitle: "Mindset Tips: Fear is not a signal"),
//           const SizedBox(height: 12),
//           _buildUpdateCard(
//               imageUrl: " ",
//               title: "Be patient, setup will come",
//               subtitle: "Discipline over emotion."),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 2,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bar_chart), label: 'Activity'),
//           BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.format_quote), label: 'Quotes'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.pie_chart), label: 'Portfolio'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }

//   Widget _buildPopularCard({
//     required IconData icon,
//     required String label,
//     required Color backgroundColor,
//   }) {
//     return Container(
//       //width: 120,
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon,
//               size: 32,
//               color: backgroundColor == Colors.grey[200]
//                   ? Colors.black
//                   : Colors.white),
//           const SizedBox(height: 8),
//           Text(label,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: backgroundColor == Colors.grey[200]
//                     ? Colors.black
//                     : Colors.white,
//               )),
//         ],
//       ),
//     );
//   }

//   Widget _buildUpdateCard({
//     required String imageUrl,
//     required String title,
//     required String subtitle,
//   }) {
//     return Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.network(imageUrl, fit: BoxFit.fitWidth)),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 4),
//                 Text(subtitle, style: const TextStyle(color: Colors.grey)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:chart_mentor/screens/chartofday.dart';
import 'package:flutter/material.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: const Icon(Icons.arrow_back),
      //   title: const Text('Quotes'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ListView(
          padding: EdgeInsets.all(screenWidth * 0.04),
          children: [
            const Row(
              children: [
                Icon(Icons.access_time, size: 18),
                SizedBox(width: 8),
                Text("Friday, 17 May",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: screenHeight * 0.005),
            const Text("Nifty sideways, avoid entries"),
            SizedBox(height: screenHeight * 0.02),
            const Text("Today's Quote",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight * 0.01),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('"Trade only when it’s clear"',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            ),
            SizedBox(height: screenHeight * 0.03),
            const Text("Popular",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight * 0.015),
            SizedBox(
              height: screenHeight * 0.3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chartofday(),
                        )),
                    child: _buildPopularCard(
                      icon: Icons.bar_chart,
                      label: "Chart of the Day",
                      backgroundColor: Colors.blue,
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.2,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  _buildPopularCard(
                    icon: Icons.play_circle_outline,
                    label: "New Learning Video",
                    backgroundColor: Colors.grey[200]!,
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.2,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            const Text("Recent Updates",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight * 0.015),
            _buildUpdateCard(
              imageUrl: "assets/images/Image1.png",
              title: "Market don't care about your hopes",
              subtitle: "Mindset Tips: Fear is not a signal",
              screenHeight: screenHeight,
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildUpdateCard(
              imageUrl: "assets/images/Image1.png",
              title: "Be patient, setup will come",
              subtitle: "Discipline over emotion.",
              screenHeight: screenHeight,
            ),
          ],

          // bottomNavigationBar: BottomNavigationBar(
          //   backgroundColor: Colors.white,
          //   currentIndex: 2,
          //   selectedItemColor: Colors.blue,
          //   unselectedItemColor: Colors.grey,
          //   type: BottomNavigationBarType.fixed,
          //   items: const [
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.bar_chart), label: 'Activity'),
          //     BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.format_quote), label: 'Quotes'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.pie_chart), label: 'Portfolio'),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          //   ],
        ),
      ),
    );
  }

  Widget _buildPopularCard({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 32,
              color: backgroundColor == Colors.grey[200]
                  ? Colors.black
                  : Colors.white),
          const SizedBox(height: 8),
          Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: backgroundColor == Colors.grey[200]
                    ? Colors.black
                    : Colors.white,
              )),
        ],
      ),
    );
  }

  Widget _buildUpdateCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required double screenHeight,
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              height: screenHeight * 0.23,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
