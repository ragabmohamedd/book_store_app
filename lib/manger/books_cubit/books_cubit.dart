import 'package:bloc/bloc.dart';
import 'package:booklyapp/data/booksmodel/booksmodel.dart';
import 'package:booklyapp/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.homeRepo) : super(BooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBooks() async {
    emit(Booksloading());

    var result = await homeRepo.fetchBooks();

    result.fold(
      (failure) {
        emit(BooksFailure(failure.errMassage));
      },
      (books) {
        emit(BooksSuccess(books));
      },
    );
  }
}
