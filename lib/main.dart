import 'package:chart_mentor/screens/auth/numberscreen.dart';
import 'package:chart_mentor/screens/splashscreen.dart';
import 'package:chart_mentor/screens/page1.dart';
import 'package:flutter/material.dart';

import 'screens/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'chat mentor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
