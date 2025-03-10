import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case%20copy.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();

    result.fold(
      (failure) => emit(
        NewestBooksFailure(
          failure.toString(),
        ),
      ),
      (books) => emit(
        NewestBooksSuccess(books),
      ),
    );
  }
}
