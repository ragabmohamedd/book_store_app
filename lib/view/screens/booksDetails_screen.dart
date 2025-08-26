import 'package:booklyapp/manger/books_cubit/books_cubit.dart';
import 'package:booklyapp/view/widgets/Horizontal_ListView.dart';
import 'package:booklyapp/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksdetailsScreen extends StatelessWidget {
  const BooksdetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.black,

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, size: 35),
            color: Colors.white,
          ),
        ],
      ),

      body: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return BlocBuilder<BooksCubit, BooksState>(
                builder: (context, state) {
                  if (state is Booksloading) {
                    return Center(child: SingleChildScrollView());
                  } else if (state is BooksSuccess) {
                    return Column(
                      children: [
                        SizedBox(height: 5),

                        SizedBox(
                          height: 300,

                          child: Center(
                            child: CustomBookImage(
                              imageUrl:
                                  state.books[index].imageUrl ??
                                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Fphotos%2Fbook&psig=AOvVaw32ZJ1SY1Y81NyxaLDsXZPv&ust=1756209222880000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOCbsajzpY8DFQAAAAAdAAAAABAE',
                            ),
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          state.books[index].title ?? 'The Jungle Book',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          state.books[index].description ?? 'Rudyard Kipling',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 35),

                        Text(
                          '🌟 4.8(2390)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 180,
                              child: TextButton(
                                onPressed: () {},

                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  '19.99',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 50,
                              width: 180,
                              child: TextButton(
                                onPressed: () {},

                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.deepOrangeAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Free Preview',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'You can also like',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 200, child: HorizontalListview()),
                      ],
                    );
                  } else if (state is BooksFailure) {
                    return Text(state.errMassage);
                  } else {
                    return Text(state.toString());
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
