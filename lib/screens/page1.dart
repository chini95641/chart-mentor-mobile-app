import 'package:chart_mentor/screens/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.sizeOf(context).width;
    var heights = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: widths,
              height: heights * .9,
              child: Stack(
                children: [
                  // Background image (full screen)

                  // Overlay image (positioned)
                  Positioned(
                    top: heights * .2,
                    child: Image.asset(
                      "assets/images/Group 7.png",
                      fit: BoxFit.contain,
                      width: widths,
                    ),
                  ),
                  Positioned(
                    top: heights * .05,
                    left: 10,
                    bottom: heights * .35,
                    child: Padding(
                      padding: EdgeInsets.only(left: widths * .2),
                      child: Image.asset(
                        "assets/images/Group.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),

                  Positioned(
                    top: heights * .65,
                    right: 5,
                    left: 5,
                    child: Column(
                      children: [
                        Text(
                          '  Online mentor with 24 hours to solve your queries',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Leading app for traders and investors. It offers a set of financial informational',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 10),
                ],
              ),
              //SizedBox(height: 10),
            ),
            GestureDetector(
              onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Page2();
                              },
                            ));
              },
              child: Center(child: Text('skip')),
            )
          ],
        ),
      ),
    );
  }
}
