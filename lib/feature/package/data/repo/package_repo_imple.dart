import '../../../../core/database/dao/package_dao.dart';
import '../model/package_model.dart';
import 'package_repo.dart';

class PackageRepoImpl implements PackageRepo {
  final PackageDao _dao;

  PackageRepoImpl(this._dao);

  @override
  Future<List<PackageModel>> getPackages() async {
    return await _dao.getAllPackages();
  }

  @override
  Future<void> insertPackages(List<PackageModel> data) async {
    await _dao.insertPackages(data);
  }

  @override
  Future<void> updatePackageSelection(int id, bool isSelected) async {
    await _dao.updateSelection(id, isSelected);
  }
}
