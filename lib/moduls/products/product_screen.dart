import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/shop_cubit/shop_layout_cubit.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/resoruces/app_colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (ShopLayoutCubit
            .get(context)
            .homeModel == null || ShopLayoutCubit
            .get(context)
            .categoryModel == null) {
          ShopLayoutCubit.get(context).getHomeData();
          return Center(child: CircularProgressIndicator());
        } else {
          return productBuilder(ShopLayoutCubit
              .get(context)
              .homeModel!, ShopLayoutCubit
              .get(context)
              .categoryModel!, context);
        }
      },
    );
  }
}

Widget productBuilder(HomeModel model, CategoryModel categoryModel, context) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: model.data.banners.map((e) {
              return Image.network(
                e.image,
                fit: BoxFit.cover,
              );
            }).toList(),
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              initialPage: 1,
              scrollDirection: Axis.horizontal,
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
            )),
        SizedBox(height: 20),
        Text("Category",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
        Container(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return buildCategoryItem(categoryModel.data.data[index]);
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: categoryModel.data.data.length,
            physics: BouncingScrollPhysics(),),
        ),
        SizedBox(height: 20),
        Text("New Product",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
        Container(
          color: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.56,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(model.data.products.length, (index) {
                return getGritProduct(model, index, context);
              }),
            ),
          ),
        )
      ],
    ),
  );
}

Widget getGritProduct(model, index, context) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image.network(
              model.data.products[index].image,
              fit: BoxFit.fill,
              width: double.infinity,
              height: 150,
            ),
            if (model.data.products[index].discount != null)
              Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "discount",
                    style: TextStyle(
                        fontSize: 8,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
          ],
        ),
        Text(
          model.data.products[index].name,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(fontSize: 14, height: 1.3),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                model.data.products[index].price.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, height: 1.3, color: Colors.blue),
              ),
              SizedBox(
                width: 5,
              ),
              if (model.data.products[index].discount != null)
                Text(
                  model.data.products[index].oldPrice.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: Icon(Icons.favorite, color: (ShopLayoutCubit
                      .get(context)
                      .favourites[model.data.products[index].id] ?? false) ? Colors
                      .red : Colors.grey,),
                  onPressed: () {
                    ShopLayoutCubit.get(context).changeFavourite(
                        model.data.products[index].id);
                    print(model.data.products[index].id);
                  },
                ),
              )
            ],


          ),
        ),
      ],
    ),
  );
}

Widget buildCategoryItem(DataModel data) {
  return Container(
    height: 100
    , width: 100,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(image: NetworkImage(data.image),
          height: 100,
          width: 100,
          fit: BoxFit.cover,),
        Container(color: Colors.black.withOpacity(.6),
          child: Text(data.name, style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,),
          width: double.infinity,)
      ],
    ),
  );
}