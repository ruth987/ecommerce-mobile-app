import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class UpdateProductUsecase implements UseCase<Product, UpdateProductUsecaseParams> {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  @override
  Future<Either<Failure, Product>> call(UpdateProductUsecaseParams params) async {
    return await repository.updateProduct(params.product);
  }
}

class UpdateProductUsecaseParams {
  final Product product;

  const UpdateProductUsecaseParams(this.product);
}