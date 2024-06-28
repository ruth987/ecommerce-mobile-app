import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/product_repository.dart';

class DeleteProductUsecase implements UseCase<Unit, DeleteProductUsecaseParams> {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(DeleteProductUsecaseParams params) async {
    return await repository.deleteProduct(params.id);
  }
}

class DeleteProductUsecaseParams {
  final String id;

  const DeleteProductUsecaseParams(this.id);
}