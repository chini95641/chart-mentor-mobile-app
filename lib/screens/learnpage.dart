import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: width * 0.04,
          mainAxisSpacing: width * 0.04,
          childAspectRatio: 1.2,
          children: [
            _buildLearnCard("Market Basics",
                "Introduction to trading & markets", Icons.auto_graph,
                isActive: true),
            _buildLearnCard("Stock & Index Trading",
                "Charts, patterns, & technical indicators", Icons.show_chart),
            _buildLearnCard(
                "Commodities",
                "Basics of trading gold, crude & more",
                Icons.stacked_line_chart),
            _buildLearnCard("Strategies & psychology",
                "Trading strategies & risk management", Icons.psychology_alt),
            _buildLearnCard(
                "Quizzers & Challenges", "Test your knowledge", Icons.quiz),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(currentIndex: 1),
    );
  }

  Widget _buildLearnCard(String title, String subtitle, IconData icon,
      {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(offset: Offset.fromDirection(2))],
        color: isActive ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: isActive ? Colors.white : Colors.black),
          const SizedBox(height: 3),
          Text(title,
              style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 3),
          Text(subtitle,
              style: TextStyle(
                  color: isActive ? Colors.white70 : Colors.black54,
                  fontSize: 12)),
        ],
      ),
    );
  }

  Widget _bottomBar({required int currentIndex}) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Activity'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
        BottomNavigationBarItem(
            icon: Icon(Icons.format_quote), label: 'Quotes'),
        BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart), label: 'Portfolio'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
