import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class NewsDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('News Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/Image1.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: heights * .4,
          ),
          SizedBox(height: heights * .03),
          Text("Pop Culture", style: TextStyle(color: Colors.blueAccent)),
          SizedBox(height: 10),
          Text("U.S. stock futures steady after...",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            'Photograph by Takeshi Shimizu',
            style: TextStyle(color: Colors.grey),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ReadMoreText(
                'The late 2000s marked a turning point for an entire generation—the so called "Lost Generation." Born in the 1980s and early 1990s, these individuals came of age during the Great Recession, a global economic crisis that reshaped the world and left a lasting impact on their lives. In this article, we'
                "ll explore the experiences and challenges faced by the late 2000s Lost Generation as they navigated a post-recession world.",
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              // RichText(
              //   text: const TextSpan(
              //     style: TextStyle(fontSize: 16, color: Colors.black87),
              //     children: [

              //       // TextSpan(
              //       //   text :
              //       //       // 'The late 2000s marked a turning point for an entire generation—the so called "Lost Generation." Born in the 1980s and early 1990s, these individuals came of age during the Great Recession, a global economic crisis that reshaped the world and left a lasting impact on their lives. In this article, we'
              //       //       // "ll explore the experiences and challenges faced by the late 2000s Lost Generation as they navigated a post-recession world.",
              //       // ),
              //     ],
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "Activity"),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: "Learn"),
        BottomNavigationBarItem(
            icon: Icon(Icons.format_quote), label: "Quotes"),
        BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart), label: "Portfolio"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
