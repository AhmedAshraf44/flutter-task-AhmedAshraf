import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class HomeRepo {
  Future<void> seedData();
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getSelections();
  Future<List<ProductModel>> getProducts();
}
