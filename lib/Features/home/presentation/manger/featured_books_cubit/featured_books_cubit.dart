import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();

    result.fold(
      (failure) => emit(
        FeaturedBooksFailure(
          failure.toString(),
        ),
      ),
      (books) => emit(
        FeaturedBooksSuccess(books),
      ),
    );
  }
}
