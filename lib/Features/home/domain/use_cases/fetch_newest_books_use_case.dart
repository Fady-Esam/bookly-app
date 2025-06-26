import 'package:dartz/dartz.dart';
import 'package:new_bookly_app/Features/home/domain/repos/home_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/param_use_case.dart';
import '../entities/book_entity.dart';

class FetchNewestdBooksUseCase implements ParamUseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestdBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageIndex = 0]) async {
    return await homeRepo.fetchNewestBooks();
  }
}

