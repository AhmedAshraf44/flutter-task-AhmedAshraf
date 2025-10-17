import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repo/home_repo_imple.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  final HomeRepoImpl _repo = HomeRepoImpl();

  Future<void> loadHomeData() async {
    emit(HomeLoadingState());
    try {
      await _repo.seedData();
      final categories = await _repo.getCategories();
      final selections = await _repo.getSelections();
      final products = await _repo.getProducts();
      emit(
        HomeSucessState(
          categories: categories,
          selections: selections,
          products: products,
        ),
      );
    } catch (e) {
      emit(HomeFailureState(e.toString()));
    }
  }
}
