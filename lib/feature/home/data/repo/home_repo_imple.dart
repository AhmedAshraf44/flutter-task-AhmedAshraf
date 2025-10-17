import 'package:sqflite/sqflite.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/dao/home_dao.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDao _dao = HomeDao();
  Future<bool> _isTableEmpty(String tableName) async {
    final db = await AppDatabase.database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $tableName'),
    );
    return (count ?? 0) == 0;
  }

  @override
  Future<void> seedData() async {
    final isCategoryEmpty = await _isTableEmpty('Category');
    final isSelectionEmpty = await _isTableEmpty('Selection');
    final isProductEmpty = await _isTableEmpty('Products');

    if (isCategoryEmpty) {
      await _dao.insertCategories(CategoryModel.categories);
    }

    if (isSelectionEmpty) {
      await _dao.insertSelections(CategoryModel.itemSelect);
    }

    if (isProductEmpty) {
      await _dao.insertProducts(ProductModel.productsList);
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async =>
      await _dao.getAllCategories();

  @override
  Future<List<CategoryModel>> getSelections() async =>
      await _dao.getAllSelections();

  @override
  Future<List<ProductModel>> getProducts() async => await _dao.getAllProducts();
}
