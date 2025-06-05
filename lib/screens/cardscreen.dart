// import 'package:flutter/material.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [

//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class DashboardScreen extends StatefulWidget {
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   final List<_DashboardItem> items = [
//     _DashboardItem('Market', Icons.show_chart, Colors.blue),
//     _DashboardItem('Index', Icons.bar_chart, Colors.purple),
//     _DashboardItem('Stocks', Icons.trending_up, Colors.pink),
//     _DashboardItem('Commodities', Icons.account_balance, Colors.orange),
//     _DashboardItem('Learn', Icons.menu_book, Colors.green),
//     _DashboardItem('Quotes', Icons.format_quote, Colors.cyan),
//     _DashboardItem('News', Icons.article, Colors.indigo),
//     _DashboardItem('Quizzes', Icons.quiz, Colors.redAccent),
//     _DashboardItem('Ask Updates', Icons.campaign, Colors.amber),
//     _DashboardItem('Talk to Mentor', Icons.support_agent, Colors.blueAccent),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Chart Mentor')),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           itemCount: items.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 12,
//             crossAxisSpacing: 12,
//             childAspectRatio: 1.2,
//           ),
//           itemBuilder: (context, index) {
//             final item = items[index];
//             return InkWell(
//               onTap: () {
//                 // Navigate to respective screen
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           PlaceholderScreen(title: item.title),
//                     ));
//               },
//               child: Card(
//                 color: item.color,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 elevation: 4,
//                 child: Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(item.icon, color: Colors.white, size: 36),
//                       SizedBox(height: 10),
//                       Text(
//                         item.title,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 1, // Learn is selected
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.timeline), label: 'Activity'),
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
// }

// class _DashboardItem {
//   final String title;
//   final IconData icon;
//   final Color color;

//   _DashboardItem(this.title, this.icon, this.color);
// }

// class PlaceholderScreen extends StatelessWidget {
//   final String title;
//   const PlaceholderScreen({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(child: Text("This is the $title screen.")),
//     );
//   }
// }

import 'package:chart_mentor/screens/indexhistory.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final List<_DashboardItem> items = [
    _DashboardItem('Market', Icons.show_chart, Colors.blue),
    _DashboardItem('Index', Icons.bar_chart, Colors.purple),
    _DashboardItem('Stocks', Icons.trending_up, Colors.pink),
    _DashboardItem('Commodities', Icons.account_balance, Colors.orange),
    _DashboardItem('Learn', Icons.menu_book, Colors.green),
    _DashboardItem('Quotes', Icons.format_quote, Colors.cyan),
    _DashboardItem('News', Icons.article, Colors.indigo),
    _DashboardItem('Quizzes', Icons.quiz, Colors.redAccent),
    _DashboardItem('Ask Updates', Icons.campaign, Colors.amber),
    _DashboardItem('Talk to Mentor', Icons.support_agent, Colors.blueAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/Logo.png',
                  height: 30,
                ),
                Text(
                  'Chart Mentor',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => items.length == 2
                        ? IndexInsightsScreen()
                        : PlaceholderScreen(title: item.title),
                  ),
                );
              },
              child: Card(
                color: item.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(item.icon, color: Colors.white, size: 36),
                      SizedBox(height: 10),
                      Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Item Model
class _DashboardItem {
  final String title;
  final IconData icon;
  final Color color;

  _DashboardItem(this.title, this.icon, this.color);
}

// Reusable Placeholder Screen
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("This is the $title screen.")),
    );
  }
}
