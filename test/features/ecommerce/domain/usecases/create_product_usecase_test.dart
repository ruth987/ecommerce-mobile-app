import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/entities/product.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/usecases/create_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late CreateProductUsecase createProduct;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    createProduct = CreateProductUsecase(mockProductRepository);
  });

  test('should create product using the repository', () async {
    // arrange
    const tProduct = Product(
        id: '',
        name: 'name',
        description: 'description',
        price: 123.45,
        imageUrl: 'https://product.image.com/id');

    when(mockProductRepository.createProduct(tProduct))
        .thenAnswer((_) async => const Right(tProduct));

    // act
    final result = await createProduct(const CreateProductUsecaseParams(tProduct));

    // assert
    expect(result, const Right(tProduct));
    verify(mockProductRepository.createProduct(tProduct));
    verifyNoMoreInteractions(mockProductRepository);
  });
}