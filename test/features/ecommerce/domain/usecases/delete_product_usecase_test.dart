import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/usecases/delete_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late DeleteProductUsecase deleteProduct;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    deleteProduct = DeleteProductUsecase(mockProductRepository);
  });

  test('should delete product from the repository', () async {
    // arrange
    const tProductId = 'id';

    when(mockProductRepository.deleteProduct(tProductId))
        .thenAnswer((_) async => const Right(unit));

    // act
    final result = await deleteProduct(const DeleteProductUsecaseParams(tProductId));

    // assert
    expect(result, const Right(unit));
    verify(mockProductRepository.deleteProduct(tProductId));
    verifyNoMoreInteractions(mockProductRepository);
  });
}