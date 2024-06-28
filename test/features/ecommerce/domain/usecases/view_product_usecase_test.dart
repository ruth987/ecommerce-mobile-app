import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/entities/product.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/usecases/view_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'view_product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late ViewProductUsecase getProduct;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getProduct = ViewProductUsecase(mockProductRepository);
  });

  test('should get product from the repository', () async {
    // arrange
    const tId = 'id';
    const tProduct = Product(
        id: tId,
        name: 'name',
        description: 'description',
        price: 123.45,
        imageUrl: 'https://product.image.com/id');

    when(mockProductRepository.getProduct(tId))
        .thenAnswer((_) async => const Right(tProduct));

    // act
    final result = await getProduct(const ViewProductUsecaseParams(tId));

    // assert
    expect(result, const Right(tProduct));
    verify(mockProductRepository.getProduct(tId));
    verifyNoMoreInteractions(mockProductRepository);
  });
}