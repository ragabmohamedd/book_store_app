import 'package:booklyapp/manger/books_cubit/books_cubit.dart';
import 'package:booklyapp/repos/home_repo_impl.dart';
import 'package:booklyapp/utils/api_service.dart';
import 'package:booklyapp/view/screens/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BooksCubit(HomeRepoImpl(ApiService(Dio())))..fetchBooks(),

      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashView()),
    );
  }
}
