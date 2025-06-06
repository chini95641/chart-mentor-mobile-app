import 'package:flutter/material.dart';

class EWalletDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'E-Wallet Detail',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Balance',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '5,82,375',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Color(0xFF4A90E2),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/1200px-Visa_Inc._logo.svg.png',
                        height: 40,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 20,
                      child: Text(
                        'Card Number',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 20,
                      child: Text(
                        '9834 9304 8129 2394',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 20,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                'John Andrean',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Text(
                                  'Valid Date',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                                Text(
                                  '08 / 30',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   top: 140,
                    //   left: 60,
                    //   child: Text(
                    //     'Valid Date',
                    //     style: TextStyle(color: Colors.white70, fontSize: 12),
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 160,
                    //   left: 20,
                    //   child: Text(
                    //     '08 / 30',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activity',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See More →',
                        style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  _buildActivityItem('EXELA TECHNOLOGIES INC', '-1920',
                      Colors.red, '03/05/2025', Icons.arrow_downward),
                  _buildActivityItem('GENERAL ELECTRIC CO', '+2420',
                      Colors.green, '03/05/2025', Icons.arrow_upward),
                  _buildActivityItem('CASTOR MARITIME INC', '+3192',
                      Colors.green, '03/05/2025', Icons.arrow_upward),
                  _buildActivityItem('GENERAL ELECTRIC CO', '-125', Colors.red,
                      '03/05/2025', Icons.arrow_downward),
                  _buildActivityItem('CASTOR MARITIME INC', '+3192',
                      Colors.green, '03/05/2025', Icons.arrow_upward),
                  _buildActivityItem('EXELA TECHNOLOGIES INC', '-1480',
                      Colors.red, '03/05/2025', Icons.arrow_downward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityItem(
      String title, String amount, Color color, String date, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16)),
                Text(date,
                    style: TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
                fontSize: 16, color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
