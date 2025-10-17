// home_main_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/feature/add/presentation/view/add_view.dart';
import 'package:flutter_task/feature/advertising/presentation/view/advertising_view.dart';
import 'package:flutter_task/feature/chat/presentation/view/chat_view.dart';
import 'package:flutter_task/feature/home_main/data/nav_bar_model.dart';
import 'package:flutter_task/feature/profile/presentation/view/profile_view.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/view/home_view.dart';
part 'home_main_state.dart';

class HomeMainCubit extends Cubit<HomeMainState> {
  HomeMainCubit() : super(HomeMainInitialState());

  static HomeMainCubit get(context) => BlocProvider.of(context);

  final List<NavBarModel> navData = [
    const NavBarModel(label: 'الرئيسية', asset: Assets.imagesNavBarHome),
    const NavBarModel(label: 'محادثة', asset: Assets.imagesNavBarChat),
    const NavBarModel(label: 'أضف إعلان', asset: Assets.imagesNavBarAdd),
    const NavBarModel(
      label: 'إعلاناتي',
      asset: Assets.imagesNavBarAdvertisement,
    ),
    const NavBarModel(label: 'حسابي', asset: Assets.imagesNavBarProfile),
  ];

  final List<Widget> pages = const [
    HomeView(),
    ChatView(),
    AddView(),
    AdvertisingView(),
    ProfileView(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeMainChangeIndexState());
  }
}
