import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/shop_cubit/shop_layout_cubit.dart';
import 'package:shop_app/resoruces/app_colors.dart';
import 'package:shop_app/resoruces/constants.dart';
import 'package:shop_app/widgets/button_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopLayoutCubit, ShopLayoutState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if(ShopLayoutCubit.get(context).loginModel==null)
          ShopLayoutCubit.get(context).getUserData();
        return Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("Name  : " ,
                    style: TextStyle(color: AppColors.primary,fontSize: 20),
                  ),
                  Text((ShopLayoutCubit.get(context).loginModel?.data.name ??"").toUpperCase() ,
                  style: TextStyle(color: AppColors.black,fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height:20),
              Row(
                children: [
                  Text("Email  : " ,
                    style: TextStyle(color: AppColors.primary,fontSize: 20),
                  ),
                  Text((ShopLayoutCubit.get(context).loginModel?.data.email ??"") ,
                    style: TextStyle(color: AppColors.black,fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height:20),
              Row(
                children: [
                  Text("Phone  : " ,
                    style: TextStyle(color: AppColors.primary,fontSize: 20),
                  ),
                  Text((ShopLayoutCubit.get(context).loginModel?.data.phone ??"") ,
                    style: TextStyle(color: AppColors.black,fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height:20),
              SizedBox(height:20),
              getButton(onPressedFun: (){
                Constants.LogOut(context);
              }, text:"Log out")
            ],
          ),
        );
      },
    );
  }
}
