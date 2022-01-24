import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/models/on_boarding_model.dart';
import 'package:shop_app/resoruces/assets.dart';
import 'package:shop_app/resoruces/strings.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static get(context) => BlocProvider.of<OnBoardingCubit>(context);

  List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(AppAssets.shop1,AppStrings.onBoardingTitle1,AppStrings.onBoardingSubTitle1),
    OnBoardingModel(AppAssets.shop2,AppStrings.onBoardingTitle2,AppStrings.onBoardingSubTitle2),
    OnBoardingModel(AppAssets.shop3,AppStrings.onBoardingTitle3,AppStrings.onBoardingSubTitle3),
  ];

  bool isLast = false;

  startState() {
    emit(OnBoardingInitial());
  }

}
