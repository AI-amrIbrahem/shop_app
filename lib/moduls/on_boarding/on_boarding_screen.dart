import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/data/prefrence/app_pref.dart';
import 'package:shop_app/models/on_boarding_model.dart';
import 'package:shop_app/moduls/login/login_screen.dart';
import 'package:shop_app/resoruces/app_colors.dart';
import 'package:shop_app/resoruces/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'on_boarding_cubit/on_boarding_cubit.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  void submit(context){
    CashHelper.saveData(key: AppStrings.onBoardingKey, value: true);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }
  @override
  Widget build(BuildContext context) {
    var controller = PageController();
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                submit(context);
              },
              child: Text(
                AppStrings.skipOnBoarding,
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        if (index == (OnBoardingCubit.get(context).onBoardingScreens.length - 1)) {
                          OnBoardingCubit.get(context).isLast = true;
                        }else{
                          OnBoardingCubit.get(context).isLast = false;
                        }
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: getItem(OnBoardingCubit.get(context)
                              .onBoardingScreens[index]),
                        );
                      },
                      itemCount:
                          OnBoardingCubit.get(context).onBoardingScreens.length,
                      controller: controller,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                        ),
                      ),
                      FloatingActionButton(
                          onPressed: () {
                            if (OnBoardingCubit.get(context).isLast) {
                              submit(context);
                            }
                            controller.nextPage(
                                duration: Duration(milliseconds: 700),
                                curve: Curves.bounceInOut);
                          },
                          child: Icon(Icons.navigate_next)),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  getItem(OnBoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Lottie.asset(model.img),
        Text(
          model.title,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          model.subTitle,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
