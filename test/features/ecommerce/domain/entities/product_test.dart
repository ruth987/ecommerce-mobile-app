import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_clean_arch/features/ecommerce/domain/entities/product.dart';

void main() {
  final tProduct = Product(
    id: '1',
    name: 'Test Product',
    description: 'Test Description',
    imageUrl: 'http://test.com/image.jpg',
    price: 99.99,
  );

  test('should be a subclass of Product entity', () async {
    // assert
    expect(tProduct, isA<Product>());
  });
}
