import 'package:chart_mentor/screens/Learnpage.dart';
import 'package:chart_mentor/screens/auth/numberscreen.dart';
import 'package:chart_mentor/screens/homescreen.dart';
import 'package:chart_mentor/screens/chartofday.dart';
import 'package:chart_mentor/screens/feedscreen.dart';
import 'package:chart_mentor/screens/hsitory.dart';
import 'package:chart_mentor/screens/indexhistory.dart';
import 'package:chart_mentor/screens/learn_topic.dart';
import 'package:chart_mentor/screens/long_term_inv.dart';
import 'package:chart_mentor/screens/newsdetail.dart';
import 'package:chart_mentor/screens/newsscreen.dart';
import 'package:chart_mentor/screens/particpant.dart';
import 'package:chart_mentor/screens/piechatscreen.dart';
import 'package:chart_mentor/screens/profile.dart';
import 'package:chart_mentor/screens/qoute.dart';
import 'package:chart_mentor/screens/quizinput.dart';
import 'package:chart_mentor/screens/quizscreen.dart';
import 'package:chart_mentor/screens/splashscreen.dart';
import 'package:chart_mentor/screens/page1.dart';
import 'package:chart_mentor/screens/stockinsight.dart';
import 'package:chart_mentor/screens/swingtrading.dart';
import 'package:chart_mentor/screens/talktomentor.dart';
import 'package:chart_mentor/screens/wallet_screen.dart';
import 'package:chart_mentor/screens/watchlist.dart';
import 'package:chart_mentor/screens/watchlistto_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/page2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: //DashboardScreen()
             SplashScreen()
            //LearnTopicsScreen()
            //ChartMentorScreen()
            // ChatScreen()
            //FeedScreen()
            // SwingTradingScreen()
            //LongTermScreen()
            //PastHistoryScreen()
            //Watchlist()
            //AssetDetailScreen()
            //EWalletDetailScreen()
            //LearnTopicsScreen()
            //FeedScreen()
            //QuizTextInputScreen()
            // QuizQuestionScreen()
            //NewsDetailsScreen()
            // LearnScreen()
            //NewsScreen()
            //Chartofday()
            //PortfolioScreen(),
            //QuotesScreen() //
        //ProfileScreen()
        //StocksInsightsScreen()
        //IndexInsightsScreen()
        // HomeScreen(),
        );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1; // Default to "Learn"

  final List<Widget> _screens = [
    PlaceholderScreen(title: 'Activity'),
    DashboardScreen(),
    PlaceholderScreen(title: 'Quotes'),
    PlaceholderScreen(title: 'Portfolio'),
    PlaceholderScreen(title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.timeline), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_quote), label: 'Quotes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), label: 'Portfolio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_4_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}
