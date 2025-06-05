import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(width * 0.04),
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Featured News
          _featuredNews(heights: heights * .3),

          const SizedBox(height: 20),
          _sectionHeader("Trending"),
          const SizedBox(height: 12),
          _horizontalNewsList(heights: heights * .3, widths: width * .3),

          const SizedBox(height: 20),
          _sectionHeader("Topic"),
          const SizedBox(height: 12),
          _verticalNewsItem("Titan Machinery's Q1 results beat expectations"),
          const SizedBox(height: 12),
          _verticalNewsItem("Trump tax bill clears procedural vote in US"),
        ],
      ),
      bottomNavigationBar: _bottomBar(currentIndex: 2),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const Text("See more", style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _featuredNews({required double heights}) {
    return Container(
      height: heights,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/images/Image1.png'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(16),
      child: Container(
        color: Colors.black.withOpacity(0.4),
        padding: const EdgeInsets.all(8),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("U.S. stock futures steady after selloff",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("Published on 17 May 2025\nWritten by Tim Hansen",
                style: TextStyle(color: Colors.white70, fontSize: 12)),
            SizedBox(height: 4),
            Text("Read now",
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _horizontalNewsList(
      {required double heights, required double widths}) {
    return SizedBox(
      height: heights,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _newsCard("Trump's Golden Dome plan", "Historical", heights),
          _newsCard("CorVel reports Q4 earnings beat", "Pop Culture", heights),
        ],
      ),
    );
  }

  Widget _newsCard(String title, String category, double widths) {
    return Container(
      width: widths,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset('assets/images/Image1.png', fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(category,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _verticalNewsItem(String title) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset('assets/images/Image1.png', fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Expanded(
            child: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }

  Widget _bottomBar({required int currentIndex}) {
    return BottomNavigationBar(
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
