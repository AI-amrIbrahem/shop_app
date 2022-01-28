import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/data/prefrence/app_pref.dart';
import 'package:shop_app/data/repo/repo.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/moduls/category/category_screen.dart';
import 'package:shop_app/moduls/favourite/favourite_screen.dart';
import 'package:shop_app/moduls/products/product_screen.dart';
import 'package:shop_app/moduls/setting/setting_screen.dart';
import 'package:shop_app/resoruces/strings.dart';

part 'shop_layout_state.dart';

class ShopLayoutCubit extends Cubit<ShopLayoutState> {
  ShopLayoutCubit() : super(ShopLayoutInitial());

  Repo repo = Repo();
  static ShopLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeCurrentIndex(int index){
    currentIndex = index;
    emit(ChangeNavState());
  }

  List<Widget> screens = [
    ProductScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingScreen()
  ];

   HomeModel? homeModel;
  getHomeData(){
    emit(ShopLoadingState());
    repo.getHomeData(CashHelper.getData(key:  AppStrings.tokenKey)).then((value) {
      homeModel = value;
      emit(ShopSuccessState());
    }).catchError((error){
      emit(ShopErrorState(error));
    });
  }

}
