part of 'shop_layout_cubit.dart';

@immutable
abstract class ShopLayoutState {}

class ShopLayoutInitial extends ShopLayoutState {}

class ChangeNavState extends ShopLayoutState {}

class ShopLoadingState extends ShopLayoutState {}

class ShopSuccessState extends ShopLayoutState {}

class ShopErrorState extends ShopLayoutState {
  String error;

  ShopErrorState(this.error);
}

class ShopSuccessFavouriteState extends ShopLayoutState {}

class ShopSuccessErrorState extends ShopLayoutState {}
