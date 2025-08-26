import 'package:booklyapp/data/booksmodel/booksmodel.dart';
import 'package:booklyapp/errors/failures.dart';
import 'package:booklyapp/repos/home_repo.dart';
import 'package:booklyapp/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failures, List<Book>>> fetchBooks() async {
    try {
      var data = await apiService.get();

      // بدل ['items'] استخدم ['record']['books']
      final booksJson = data['record']['books'] as List;

      List<Book> books = booksJson.map((b) => Book.fromJson(b)).toList();

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
