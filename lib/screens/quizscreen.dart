// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class QuizQuestionScreen extends StatefulWidget {
//   @override
//   _QuizQuestionScreenState createState() => _QuizQuestionScreenState();
// }

// class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
//   int selectedOption = -1;
//   final List<String> options = ["Nifty", "OTCEI Index", "Sensex", "FTSE100"];

//   Future<List<QuizData>> fetchQuotes() async {
//     final url = Uri.parse('https://test-5o8z.onrender.com/api/quizzes');

//     final response = await http.get(
//       url,
//       headers: {
//         'Authorization':
//             'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxNDgyYTk1Ni1lZWU3LTRkYjMtYmZjZi1lNjIwMzc1YWI4MzgiLCJuYW1lIjoidGVzdCB0ZXN0Iiwicm9sZSI6IkFETUlOIiwiZW1haWwiOiJ0ZXN0QGdtYWlsLmNvbSIsImlhdCI6MTc0OTMwMjM0MywiZXhwIjoxNzQ5ODIwNzQzfQ.3P-Yae2j0v6jZ--fa7Nr1ZfQ5mE_EcqrXQVesnxzAkY',
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//     );
//     print(response.body + 'Qoutes api');
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonData = json.decode(response.body);
//       final List<dynamic> data = jsonData['result'];
//       return data.map((item) => QuizData.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load quotes');
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchQuotes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final widths = MediaQuery.of(context).size.width;
//     final heights = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.blue[500],
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//             child: Row(
//               children: [
//                 Icon(Icons.arrow_back),
//                 Expanded(
//                   child: LinearProgressIndicator(
//                     value: 0.1,
//                     backgroundColor: Colors.grey[300],
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Icon(Icons.person_outline),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.all(8),
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: CircleAvatar(
//                       backgroundColor: Colors.blue[200],
//                       radius: 24,
//                       child: Text('2', style: TextStyle(fontSize: 20)),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text("QUESTION 2 OF 10",
//                       style: TextStyle(color: Colors.grey)),
//                   SizedBox(height: 8),
//                   Text(
//                     "Which of the following is a global stock market index?",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 24),
//                   ...List.generate(
//                       options.length,
//                       (index) => OptionTile(
//                             index: index,
//                             text: options[index],
//                             selected: selectedOption == index,
//                             onTap: () => setState(() => selectedOption = index),
//                           )),
//                   Spacer(),
//                   Container(
//                     height: heights * .06,
//                     width: widths * .9,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.blue),
//                     child: Center(
//                         child: Text(
//                       'Next',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     )),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OptionTile extends StatelessWidget {
//   final int index;
//   final String text;
//   final bool selected;
//   final VoidCallback onTap;

//   OptionTile(
//       {required this.index,
//       required this.text,
//       required this.selected,
//       required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.only(bottom: 12),
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           border: Border.all(color: selected ? Colors.blue : Colors.grey[300]!),
//           borderRadius: BorderRadius.circular(12),
//           color: selected ? Colors.blue[50] : Colors.white,
//         ),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 12,
//               backgroundColor: selected ? Colors.blue : Colors.grey[300],
//               child: Text(String.fromCharCode(65 + index),
//                   style: TextStyle(fontSize: 12, color: Colors.white)),
//             ),
//             SizedBox(width: 12),
//             Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
//             if (selected) Icon(Icons.check_circle, color: Colors.blue),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class QuizData {
//   final String id;
//   final String question;

//   QuizData({required this.id, required this.question});

//   factory QuizData.fromJson(Map<String, dynamic> json) {
//     return QuizData(
//       id: json['_id'] ?? '',
//       question: json['question'] ?? '',
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuizQuestionScreen extends StatefulWidget {
  @override
  _QuizQuestionScreenState createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  Future<List<QuizData>>? _quizFuture;
  int currentIndex = 0;
  Map<int, int> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    _quizFuture = fetchQuizzes();
  }

  Future<List<QuizData>> fetchQuizzes() async {
    final url = Uri.parse('https://test-5o8z.onrender.com/api/quizzes');
    final response = await http.get(
      url,
      headers: {
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxNDgyYTk1Ni1lZWU3LTRkYjMtYmZjZi1lNjIwMzc1YWI4MzgiLCJuYW1lIjoidGVzdCB0ZXN0Iiwicm9sZSI6IkFETUlOIiwiZW1haWwiOiJ0ZXN0QGdtYWlsLmNvbSIsImlhdCI6MTc0OTMwMjM0MywiZXhwIjoxNzQ5ODIwNzQzfQ.3P-Yae2j0v6jZ--fa7Nr1ZfQ5mE_EcqrXQVesnxzAkY',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['result'];
      return data.map((item) => QuizData.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load quizzes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: _quizFuture == null
          ? Center(child: Text("Loading...", style: TextStyle(color: Colors.white)))
          : FutureBuilder<List<QuizData>>(
              future: _quizFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(color: Colors.white));
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}", style: TextStyle(color: Colors.white)));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No quizzes found", style: TextStyle(color: Colors.white)));
                }

                final quizzes = snapshot.data!;
                final quiz = quizzes[currentIndex];
                final selectedOption = selectedOptions[currentIndex];

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: (currentIndex + 1) / quizzes.length,
                              backgroundColor: Colors.grey[300],
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.person_outline, color: Colors.white),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.blue[200],
                                radius: 24,
                                child: Text('${currentIndex + 1}', style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            SizedBox(height: 16),
                            Text("QUESTION ${currentIndex + 1} OF ${quizzes.length}", style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 8),
                            Text(
                              quiz.question,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 24),
                            ...List.generate(quiz.options.length, (index) {
                              return OptionTile(
                                index: index,
                                text: quiz.options[index],
                                selected: selectedOption == index,
                                onTap: () {
                                  setState(() {
                                    selectedOptions[currentIndex] = index;
                                  });
                                },
                              );
                            }),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                if (currentIndex < quizzes.length - 1) {
                                  setState(() {
                                    currentIndex++;
                                  });
                                } else {
                                  print('Selected Answers: $selectedOptions');
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text("Quiz Finished"),
                                      content: Text("Answers: $selectedOptions"),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(),
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    currentIndex < quizzes.length - 1 ? 'Next' : 'Finish',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final int index;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  OptionTile({
    required this.index,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: selected ? Colors.blue : Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
          color: selected ? Colors.blue[50] : Colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: selected ? Colors.blue : Colors.grey[300],
              child: Text(
                String.fromCharCode(65 + index),
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            SizedBox(width: 12),
            Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
            if (selected) Icon(Icons.check_circle, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

class QuizData {
  final String id;
  final String question;
  final List<String> options;

  QuizData({
    required this.id,
    required this.question,
    required this.options,
  });

  factory QuizData.fromJson(Map<String, dynamic> json) {
    return QuizData(
      id: json['_id'] ?? '',
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
    );
  }
}
