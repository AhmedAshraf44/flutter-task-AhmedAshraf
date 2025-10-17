import '../../../../core/database/app_database.dart';
import '../../../feature/package/data/model/package_feature_model.dart';
import '../../../feature/package/data/model/package_model.dart';

class PackageDao {
  Future<void> insertPackages(List<PackageModel> packages) async {
    final db = await AppDatabase.database;

    final existing = await db.query('packages');
    if (existing.isNotEmpty) return;

    final batch = db.batch();

    for (final package in packages) {
      final packageId = await db.insert('packages', {
        'id': package.id,
        'name': package.name,
        'price': package.price,
        'numberOfViews': package.numberOfViews,
        'bestValue': package.bestValue,
        'isSelected': package.isSelected ? 1 : 0,
        'isBestValue': package.isBestValue ? 1 : 0,
        'isSelectednumberOfViews': package.isSelectednumberOfViews ? 1 : 0,
      });

      for (final feature in package.features) {
        batch.insert('package_features', {
          'packageId': packageId,
          'title': feature.title,
          'image': feature.image,
          'stickyDurationHours': feature.stickyDurationHours,
        });
      }
    }

    await batch.commit(noResult: true);
  }

  Future<List<PackageModel>> getAllPackages() async {
    final db = await AppDatabase.database;
    final packageList = await db.query('packages');
    final List<PackageModel> result = [];

    for (final package in packageList) {
      final features = await db.query(
        'package_features',
        where: 'packageId = ?',
        whereArgs: [package['id']],
      );

      result.add(
        PackageModel(
          id: package['id'] as int,
          name: package['name'] as String,
          price: package['price'] as double,
          numberOfViews: package['numberOfViews'] as String,
          bestValue: package['bestValue'] as String?,
          isSelected: (package['isSelected'] as int) == 1,
          isBestValue: (package['isBestValue'] as int) == 1,
          isSelectednumberOfViews:
              (package['isSelectednumberOfViews'] as int) == 1,
          features: features
              .map(
                (f) => PackageFeatureModel(
                  title: f['title'] as String?,
                  image: f['image'] as String?,
                  stickyDurationHours: f['stickyDurationHours'] as String?,
                ),
              )
              .toList(),
        ),
      );
    }

    return result;
  }

  Future<void> updateSelection(int packageId, bool isSelected) async {
    final db = await AppDatabase.database;

    // await db.update('packages', {'isSelected': 0});

    await db.update(
      'packages',
      {'isSelected': isSelected ? 1 : 0},
      where: 'id = ?',
      whereArgs: [packageId],
    );
  }
}
