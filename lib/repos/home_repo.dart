import 'package:booklyapp/data/booksmodel/booksmodel.dart';
import 'package:booklyapp/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<Book>>> fetchBooks();
}
