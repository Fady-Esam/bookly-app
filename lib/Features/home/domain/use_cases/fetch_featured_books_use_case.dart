import 'package:dartz/dartz.dart';
import 'package:new_bookly_app/core/utils/param_use_case.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase implements ParamUseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageIndex = 0]) async {
    return await homeRepo.fetchFeaturedBooks(pageIndex: pageIndex);
  }
}
