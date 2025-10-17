import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/package_model.dart';
import '../../../data/repo/package_repo.dart';
part 'package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  final PackageRepo _repo;

  PackageCubit(this._repo) : super(PackageInitial());

  Future<void> loadPackages() async {
    emit(PackageLoadingState());
    try {
      await _repo.insertPackages(PackageModel.packages);
      final data = await _repo.getPackages();
      emit(PackageSuccessState(data));
    } catch (e) {
      emit(PackageFailureState(e.toString()));
    }
  }

  Future<void> updatePackageSelection(int id, bool isSelected) async {
    try {
      await _repo.updatePackageSelection(id, isSelected);
      final data = await _repo.getPackages();
      emit(PackageSuccessState(data));
    } catch (e) {
      emit(PackageFailureState(e.toString()));
    }
  }
}
