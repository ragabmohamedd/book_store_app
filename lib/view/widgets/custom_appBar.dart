import 'package:booklyapp/view/screens/search_screen.dart';
import 'package:flutter/material.dart';

class AppbarModel extends StatelessWidget {
  const AppbarModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Row(
        children: [
          Image.asset('assets/images/Logo.png', width: 120),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            icon: Icon(Icons.search, size: 35),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
