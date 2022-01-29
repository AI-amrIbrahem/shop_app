import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/data/prefrence/app_pref.dart';
import 'package:shop_app/data/repo/repo.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/models/favorite_model.dart';
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

  Map<int,bool> favourites = {};

   HomeModel? homeModel;
  void getHomeData(){
    emit(ShopLoadingState());
    repo.getHomeData(CashHelper.getData(key:  AppStrings.tokenKey)).then((value) {
      homeModel = value;
      homeModel!.data.products.forEach((element){
        favourites.addAll({ element.id : element.inFavorites });
      });
      getCategoryModel();
      //emit(ShopSuccessState());
    });
  }

  CategoryModel? categoryModel;
  void getCategoryModel(){
    repo.getCategoryModel(CashHelper.getData(key:  AppStrings.tokenKey)).then((value) {
      categoryModel = value;
      emit(ShopSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorState(error.toString()));
    });
  }

  void changeFavourite(int id){
    repo.changeFavourite(id, CashHelper.getData(key:  AppStrings.tokenKey)).then((value) {
      getFavoritesScreen();
      
      favourites[id] = value.data['message']==  "تمت الإضافة بنجاح" ?true :false;
      emit(ShopSuccessFavouriteState());
    }).catchError((error){
      print(error);
      emit(ShopSuccessErrorState());
    });
  }
  FavoriteModel? favoriteModel;
  void getFavoritesScreen(){
    repo.getFavoriteModel(CashHelper.getData(key:  AppStrings.tokenKey)).then((value) {
      favoriteModel = value;
      print(value);
      emit(ShopSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorState(error.toString()));
    });
  }

}