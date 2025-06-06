import 'package:flutter/material.dart';

import 'talktomentor.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: const Text(
          'CHART MENTOR',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView(
        children: const [
          PostCard(
            username: "Maximilian",
            handle: "@maxjacobson",
            time: "3h",
            content: "EV stock crashes after Kia Corp.",
            imageUrl: "assets/feedimages/image2.png",
            avatarUrl: "assets/feedimages/Round.png",
          ),
          PostCard(
            username: "Tabitha Potter",
            handle: "@mis_potter",
            time: "14h",
            content: "Stocks to buy now for an upside of 56%",
            imageUrl: "assets/feedimages/image3.png",
            avatarUrl: "assets/feedimages/Round1.png",
          ),
          PostCard(
            username: "Karenne",
            handle: "@karenne",
            time: "10h",
            content: "Name a show where the lead character is the worst...",
            imageUrl: "assets/feedimages/image2.png",
            avatarUrl: "assets/feedimages/Round.png",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Activity'),
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

class PostCard extends StatelessWidget {
  final String username, handle, time, content;
  final String? imageUrl;
  final String? avatarUrl;

  const PostCard(
      {super.key,
      required this.username,
      required this.handle,
      required this.time,
      required this.content,
      this.imageUrl,
      this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue,
                child: avatarUrl != null
                    ? Image.asset(avatarUrl!)
                    : Icon(Icons.person_3),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: username,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: " $handle • $time"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      content,
                      style: const TextStyle(fontSize: 15),
                    ),
                    if (imageUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(imageUrl!),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.mode_comment_outlined, size: 20, color: Colors.grey),
              Icon(Icons.autorenew, size: 20, color: Colors.grey),
              Icon(Icons.favorite_border, size: 20, color: Colors.grey),
              Icon(Icons.share_outlined, size: 20, color: Colors.grey),
            ],
          ),
          const Divider(height: 20, thickness: 0.4),
        ],
      ),
    );
  }
}
