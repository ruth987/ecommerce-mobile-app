import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewProductUsecase implements UseCase<Product, ViewProductUsecaseParams> {
  final ProductRepository repository;

  ViewProductUsecase(this.repository);

  @override
  Future<Either<Failure, Product>> call(ViewProductUsecaseParams params) async {
    return await repository.getProduct(params.id);
  }
}

class ViewProductUsecaseParams {
  final String id;

  const ViewProductUsecaseParams(this.id);
}