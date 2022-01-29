import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/shop_cubit/shop_layout_cubit.dart';
import 'package:shop_app/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (ShopLayoutCubit.get(context).categoryModel == null) {
          ShopLayoutCubit.get(context).getCategoryModel();
          return Center(child: CircularProgressIndicator());
        } else {
          CategoryModel category = ShopLayoutCubit.get(context).categoryModel!;
          return ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return buildCategoryItem(category.data.data[index]);
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: category.data.data.length,
            physics: BouncingScrollPhysics(),
          );
        }
      },
    );
  }
}

Widget buildCategoryItem(DataModel data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.teal,
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(data.image),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Spacer(),
            Text(
              data.name,
              style: TextStyle(color: Colors.white,fontSize: 20),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    ),
  );
}
