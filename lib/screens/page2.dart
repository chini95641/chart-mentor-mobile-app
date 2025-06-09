import 'package:chart_mentor/screens/auth/numberscreen.dart';
import 'package:chart_mentor/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.sizeOf(context).width;
    var heights = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: widths,
              height: heights * .6,
              child: Stack(
                children: [
                  // Background image (full screen)

                  // Overlay image (positioned)
                  Positioned(
                    //top: heights * .02,
                    //bottom: heights * .03,
                    child: Image.asset(
                      "assets/images/03.png",
                      fit: BoxFit.fill,
                      width: widths,
                      height: heights * .6,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '  Live levels in market to test your reading',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Leading app for traders and investors. It offers a set of financial informational',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: heights * .08),
              child: GestureDetector(
                onTap: () {
                  if (FirebaseAuth.instance.currentUser == null) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return NumberScreen();
                      },
                    ));
                  }
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DashboardScreen();
                    },
                  ));
                },
                child: Container(
                  height: heights * .06,
                  width: widths * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue),
                  child: Center(
                      child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )),
                ),
              ),
            )
          ])),
    );
  }
}
