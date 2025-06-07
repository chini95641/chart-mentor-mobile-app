import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = true;

  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.sizeOf(context).width;
    var heights = MediaQuery.sizeOf(context).height;
    return 
     Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     title: Row(
    //       children: [
    //         Image.asset(
    //           'assets/logo/Logo.png',
    //           height: 25,
    //         ),
    //         Text(
    //           'Chart Mentor',
    //           style: TextStyle(fontWeight: FontWeight.bold),
    //         ),
    //       ],
    //     ),
    //     actions: const [
    //       Padding(
    //         padding: EdgeInsets.only(right: 16),
    //         child: Icon(Icons.notifications_outlined),
    //       ),
    //     ],
    //   ),
       body: 
      ListView(
        //padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=3'), // Placeholder image
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John Andrean',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('john.andrean@gmail.com'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
              width: double.infinity,
              height: heights * .05,
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: Text("GENERAL",
                  style: TextStyle(color: Colors.grey.shade600))),
          _buildTile("Change Password"),
          _buildTile("Subscription"),
          _buildTile("Support"),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: heights * .05,
            decoration: BoxDecoration(color: Colors.grey.shade100),
            child: Text("THEME AND NOTIFICATION",
                style: TextStyle(color: Colors.grey)),
          ),
          SwitchListTile(
            title: const Text("Notification"),
            value: notificationsEnabled,
            onChanged: (value) => setState(() => notificationsEnabled = value),
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: darkModeEnabled,
            onChanged: (value) => setState(() => darkModeEnabled = value),
          ),
          const SizedBox(height: 16),
          Container(
              width: double.infinity,
              height: heights * .05,
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: Text("ABOUT APPLICATION",
                  style: TextStyle(color: Colors.grey))),
          _buildTile("Privacy Policy"),
          _buildTile("Terms of Use"),
          ListTile(
            title: const Text("App Version"),
            trailing: Text("3.4.2 (14832)",
                style: TextStyle(color: Colors.blue.shade700)),
          ),
        ],
      
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 4,
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.bar_chart), label: 'Activity'),
      //     BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.format_quote), label: 'Quotes'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.pie_chart), label: 'Portfolio'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
       ),
    );
  }

  Widget _buildTile(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle tap
      },
    );
  }
}
