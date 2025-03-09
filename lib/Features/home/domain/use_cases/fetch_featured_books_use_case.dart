import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';

class FetchFeaturedBooksUseCase
    extends UseCase<List<BookEntity>, NoParameters> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [NoParameters? parameters]) async {
    //check permission
    return await homeRepo.fetchFeaturedBooks();
  }
}
