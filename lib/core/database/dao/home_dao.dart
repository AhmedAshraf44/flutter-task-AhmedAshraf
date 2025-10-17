import 'package:sqflite/sqflite.dart';
import '../app_database.dart';
import '../../../feature/home/data/models/category_model.dart';
import '../../../feature/home/data/models/product_model.dart';

class HomeDao {
  // ======= CATEGORY =======
  Future<void> insertCategories(List<CategoryModel> categories) async {
    final db = await AppDatabase.database;
    final batch = db.batch();
    for (final category in categories) {
      batch.insert('Category', {
        'tittle': category.name,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final db = await AppDatabase.database;
    final result = await db.query('Category');
    return result
        .map((e) => CategoryModel(name: e['tittle'] as String))
        .toList();
  }

  // ======= SELECTION =======
  Future<void> insertSelections(List<CategoryModel> selections) async {
    final db = await AppDatabase.database;
    final batch = db.batch();
    for (final selection in selections) {
      batch.insert('Selection', {
        'tittle': selection.name,
        'image': selection.image,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
  }

  Future<List<CategoryModel>> getAllSelections() async {
    final db = await AppDatabase.database;
    final result = await db.query('Selection');
    return result
        .map(
          (e) => CategoryModel(
            name: e['tittle'] as String,
            image: e['image'] as String,
          ),
        )
        .toList();
  }

  // ======= PRODUCTS =======
  Future<void> insertProducts(List<ProductModel> products) async {
    final db = await AppDatabase.database;
    final batch = db.batch();
    for (final p in products) {
      batch.insert('Products', {
        'title': p.name,
        'image': p.imageUrl,
        'price': p.price.toString(),
        'oldPrice': p.oldPrice.toString(),
        'sales': '',
        'isFavorite': 0,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
  }

  Future<List<ProductModel>> getAllProducts() async {
    final db = await AppDatabase.database;
    final result = await db.query('Products');
    return result.map((e) {
      return ProductModel(
        imageUrl: e['image'] as String,
        name: e['title'] as String,
        price: double.tryParse(e['price'].toString()) ?? 0,
        oldPrice: double.tryParse(e['oldPrice'].toString()) ?? 0,
      );
    }).toList();
  }
}
