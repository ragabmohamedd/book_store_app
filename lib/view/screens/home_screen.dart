import 'package:flutter/material.dart';

import 'package:booklyapp/view/screens/search_screen.dart';
import 'package:booklyapp/view/widgets/Horizontal_ListView.dart';
import 'package:booklyapp/view/widgets/Vertical_ListView.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: Image.asset('assets/images/Logo.png', width: 120),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            icon: const Icon(Icons.search, size: 35),
            color: Colors.white,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalListview(),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Best Seller',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const VerticalListview(),
          ],
        ),
      ),
    );
  }
}
