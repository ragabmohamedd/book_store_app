part of 'books_cubit.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

final class Booksloading extends BooksState {}

final class BooksSuccess extends BooksState {
  final List<Book> books;

  const BooksSuccess(this.books);
}

final class BooksFailure extends BooksState {
  final String errMassage;

  const BooksFailure(this.errMassage);
}
