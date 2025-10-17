import '../model/package_model.dart';

abstract class PackageRepo {
  Future<List<PackageModel>> getPackages();
  Future<void> insertPackages(List<PackageModel> data);
  Future<void> updatePackageSelection(int id, bool isSelected);
}
