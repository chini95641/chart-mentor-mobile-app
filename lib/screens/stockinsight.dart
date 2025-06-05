import 'package:flutter/material.dart';

class StocksInsightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.sizeOf(context).width;
    var heights = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Stocks Insights",
            style: TextStyle(fontWeight: FontWeight.w600)),
        leading: BackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            Text(
              "Past History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: heights * .15,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildStockCard(
                      "BRK-B", "+22%", "Apr 22", Colors.indigo.shade400),
                  const SizedBox(width: 12),
                  _buildStockCard(
                      "DOW J", "+25%", "Apr 19", Colors.blue.shade400),
                  const SizedBox(width: 12),
                  _buildStockCard(
                      "S&P 500", "+30%", "Apr 10", Colors.green.shade400),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildMainOptionCard(
              icon: Icons.trending_up,
              title: "Swing Trading View",
              subtitle: "Short-term trend & setups",
              color: Colors.purple.shade50,
              iconColor: Colors.purple,
            ),
            const SizedBox(height: 16),
            _buildMainOptionCard(
              icon: Icons.candlestick_chart,
              title: "Long-Term Investment View",
              subtitle: "Analyze stock potential over months/years",
              color: Colors.orange.shade50,
              iconColor: Colors.deepOrange,
            ),
            const SizedBox(height: 16),
            _buildMainOptionCard(
              icon: Icons.history,
              title: "Past History",
              subtitle: "Analyze stock potential over months/years",
              color: Colors.blue.shade50,
              iconColor: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

  Widget _buildStockCard(
      String title, String percent, String date, Color color) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: color),
          ),
          SizedBox(height: 4),
          Text(
            percent,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildMainOptionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28, color: iconColor),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                SizedBox(height: 4),
                Text(subtitle,
                    style: TextStyle(color: Colors.black54, fontSize: 13)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
