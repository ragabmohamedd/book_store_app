import 'package:flutter/material.dart';

import 'package:booklyapp/data/booksmodel/booksmodel.dart';
import 'package:booklyapp/view/widgets/custom_container.dart';

class ListveiwMoadel extends StatelessWidget {
  const ListveiwMoadel({Key? key, required this.books}) : super(key: key);
  final Book books;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          itemCount: 10, // عدد العناصر
          itemBuilder: (context, index) {
            return ContainerModel();
          },
        ),
      ),
    );
  }
}
