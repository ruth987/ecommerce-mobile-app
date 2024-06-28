import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class CreateProductUsecase implements UseCase<Product, CreateProductUsecaseParams> {
  final ProductRepository repository;

  CreateProductUsecase(this.repository);

  @override
  Future<Either<Failure, Product>> call(CreateProductUsecaseParams params) async {
    return await repository.createProduct(params.product);
  }
}

class CreateProductUsecaseParams {
  final Product product;

  const CreateProductUsecaseParams(this.product);
}