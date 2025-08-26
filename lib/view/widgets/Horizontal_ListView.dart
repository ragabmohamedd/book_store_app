import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:booklyapp/manger/books_cubit/books_cubit.dart';
import 'package:booklyapp/view/screens/booksDetails_screen.dart';

import 'custom_book_image.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is Booksloading) {
          return SingleChildScrollView();
        } else if (state is BooksSuccess) {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BooksdetailsScreen(),
                        ),
                      );
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].imageUrl ??
                          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Fphotos%2Fbook&psig=AOvVaw32ZJ1SY1Y81NyxaLDsXZPv&ust=1756209222880000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOCbsajzpY8DFQAAAAAdAAAAABAE',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is BooksFailure) {
          return Center(child: Text(state.errMassage));
        }
        return Text(state.toString());
      },
    );
  }
}





















/*class HorizontalListview extends StatelessWidget {
  const HorizontalListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is Booksloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BooksSuccess) {
          final books = state.books;

          return SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final book = books[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BooksdetailsScreen(),
                        ),
                      );
                    },
                    child: CustomBookImage(
                      imageUrl:
                          book.imageUrl != null && book.imageUrl!.isNotEmpty
                          ? book.imageUrl!
                          : 'assets/images/test_image.png',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is BooksFailure) {
          return Center(child: Text(state.errMassage));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}*/





















