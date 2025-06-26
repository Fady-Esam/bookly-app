import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

abstract class ParamUseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param pageIndex]);
}
