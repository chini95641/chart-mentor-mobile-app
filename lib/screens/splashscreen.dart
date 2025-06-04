import 'package:chart_mentor/screens/page1.dart';
import 'package:flutter/material.dart';
import 'page2.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Page1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.sizeOf(context).width;
    var heights = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: widths * 0.06),
            child: Column(
              children: [
                Image.asset("assets/logo/Logo.png"),
                const SizedBox(height: 20),
                const Text(
                  'CHART MENTOR',
                  style: TextStyle(fontSize: 35),
                ),
                const Text(
                  'Charts That Teach. Levels That Lead',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
