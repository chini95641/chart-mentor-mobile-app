import 'package:flutter/material.dart';

class QuizQuestionScreen extends StatefulWidget {
  @override
  _QuizQuestionScreenState createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  int selectedOption = -1;
  final List<String> options = ["Nifty", "OTCEI Index", "Sensex", "FTSE100"];

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.arrow_back),
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.1,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                  ),
                ),
                Icon(Icons.person_outline),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
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
                      child: Text('2', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("QUESTION 2 OF 10",
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  Text(
                    "Which of the following is a global stock market index?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  ...List.generate(
                      options.length,
                      (index) => OptionTile(
                            index: index,
                            text: options[index],
                            selected: selectedOption == index,
                            onTap: () => setState(() => selectedOption = index),
                          )),
                  Spacer(),
                  Container(
                    height: heights * .06,
                    width: widths * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue),
                    child: Center(
                        child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final int index;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  OptionTile(
      {required this.index,
      required this.text,
      required this.selected,
      required this.onTap});

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
              child: Text(String.fromCharCode(65 + index),
                  style: TextStyle(fontSize: 12, color: Colors.white)),
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
