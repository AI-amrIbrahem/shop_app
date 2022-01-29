import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/prefrence/app_pref.dart';
import 'package:shop_app/layout/shop_layout/shop_cubit/shop_layout_cubit.dart';
import 'package:shop_app/moduls/login/login_screen.dart';
import 'package:shop_app/moduls/search/search_screen.dart';
import 'package:shop_app/resoruces/strings.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLayoutCubit(),
      child: BlocConsumer<ShopLayoutCubit, ShopLayoutState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = ShopLayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  AppStrings.appBarTitleLayout
              ),
              actions:[
                IconButton(
                  icon:Icon(Icons.search),
                  onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => SearchScreen(),));
                  }
                )
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeCurrentIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: "category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "favourite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "setting"),
              ],
            ),

          );
        },
      ),
    );
  }
}
