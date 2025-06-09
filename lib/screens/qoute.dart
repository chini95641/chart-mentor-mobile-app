import 'dart:convert';

import 'package:chart_mentor/screens/chartofday.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quote {
  final String text;
  final String imageUrl;

  Quote({required this.text, required this.imageUrl});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['_id'] ?? '',
      imageUrl: json['image'] ?? '',
    );
  }
}

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  // List<Quote> qoutedata = [];
  Future<List<Quote>> fetchQuotes() async {
    final url = Uri.parse('https://test-5o8z.onrender.com/api/quotes');

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
      return data.map((item) => Quote.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchQuotes();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: FutureBuilder<List<Quote>>(
            future: fetchQuotes(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Quote>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Failed to load quotes'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No quotes available'));
              }

              final quotes = snapshot.data!;

              return ListView(
                padding: EdgeInsets.all(screenWidth * 0.04),
                children: [
                  // Date Header
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

                  // Quote
                  const Text("Today's Quote",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      quotes.first.text,
                      style: const TextStyle(
                          fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Popular section using horizontal ListView
                  const Text("Popular",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: screenHeight * 0.015),
                  SizedBox(
                    height: screenHeight * 0.3,
                    width: double.infinity,
                    child: ListView(
                      //itemExtent: 2,
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

                  // Updates section using data from the same API
                  const Text("Recent Updates",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: screenHeight * 0.015),
                  ...List.generate(quotes.length, (index) {
                    final q = quotes[index];
                    print('${q.imageUrl} mydata');
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                      child: _buildUpdateCard(
                        imageUrl:
                            'https://test-5o8z.onrender.com/${q.imageUrl}' ??
                                " ",
                        // imageUrl: 'https://test-5o8z.onrender.com/uploads/2e001edd-2e85-4e7e-bceb-ea983c0d0325.png',
                        title: "Quote ${index + 1}",
                        subtitle: q.text,
                        screenHeight: screenHeight,
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ));
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
            child: Image.network(
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

 // child: FutureBuilder(
          //     future: fetchQuotes(),
          //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else if (snapshot.hasData) {
          //         var Data = snapshot.data;
          //         return ListView.builder(
          //           padding: EdgeInsets.all(screenWidth * 0.04),
          //           children: [
          //             const Row(
          //               children: [
          //                 Icon(Icons.access_time, size: 18),
          //                 SizedBox(width: 8),
          //                 Text("Friday, 17 May",
          //                     style: TextStyle(fontWeight: FontWeight.bold)),
          //               ],
          //             ),
          //             SizedBox(height: screenHeight * 0.005),
          //             const Text("Nifty sideways, avoid entries"),
          //             SizedBox(height: screenHeight * 0.02),
          //             const Text("Today's Quote",
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.bold)),
          //             SizedBox(height: screenHeight * 0.01),
          //             Container(
          //               padding: EdgeInsets.all(screenWidth * 0.04),
          //               decoration: BoxDecoration(
          //                 color: Colors.grey[100],
          //                 borderRadius: BorderRadius.circular(12),
          //               ),
          //               child: const Text('"Trade only when it’s clear"',
          //                   style: TextStyle(
          //                       fontSize: 16, fontStyle: FontStyle.italic)),
          //             ),
          //             SizedBox(height: screenHeight * 0.03),
          //             const Text("Popular",
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.bold)),
          //             SizedBox(height: screenHeight * 0.015),
          //             SizedBox(
          //               height: screenHeight * 0.3,
          //               child: ListView(
          //                 scrollDirection: Axis.horizontal,
          //                 children: [
          //                   InkWell(
          //                     onTap: () => Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                           builder: (context) => Chartofday(),
          //                         )),
          //                     child: _buildPopularCard(
          //                       icon: Icons.bar_chart,
          //                       label: "Chart of the Day",
          //                       backgroundColor: Colors.blue,
          //                       width: screenWidth * 0.4,
          //                       height: screenHeight * 0.2,
          //                     ),
          //                   ),
          //                   SizedBox(width: screenWidth * 0.03),
          //                   _buildPopularCard(
          //                     icon: Icons.play_circle_outline,
          //                     label: "New Learning Video",
          //                     backgroundColor: Colors.grey[200]!,
          //                     width: screenWidth * 0.4,
          //                     height: screenHeight * 0.2,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             SizedBox(height: screenHeight * 0.03),
          //             const Text("Recent Updates",
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.bold)),
          //             SizedBox(height: screenHeight * 0.015),
          //             _buildUpdateCard(
          //               imageUrl: Data['image'],
          //               title: Data['Description'],
          //               subtitle: "Mindset Tips: Fear is not a signal",
          //               screenHeight: screenHeight,
          //             ),
          //             SizedBox(height: screenHeight * 0.02),
          //             _buildUpdateCard(
          //               imageUrl: "assets/images/Image1.png",
          //               title: "Be patient, setup will come",
          //               subtitle: "Discipline over emotion.",
          //               screenHeight: screenHeight,
          //             ),
          //           ],
          //         );
          //       } else {
          //         return Text('Nothing to show');
          //       }
          //     }),