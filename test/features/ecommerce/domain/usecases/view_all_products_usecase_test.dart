import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/core/usecases/usecase.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/entities/product.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/usecases/view_all_products_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Run the following command to generate needed files:
// dart run build_runner build
import 'view_all_products_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late ViewAllProductsUsecase getAllProducts;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getAllProducts = ViewAllProductsUsecase(mockProductRepository);
  });

  test('should get all products from the repository', () async {
    // arrange
    final tProduct = <Product>[];

    when(mockProductRepository.getProducts())
        .thenAnswer((_) async => Right(tProduct));

    // act
    final result = await getAllProducts(NoParams());

    // assert
    expect(result, Right(tProduct));
    verify(mockProductRepository.getProducts());
    verifyNoMoreInteractions(mockProductRepository);
  });
}