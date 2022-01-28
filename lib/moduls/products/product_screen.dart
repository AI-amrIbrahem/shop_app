import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/shop_cubit/shop_layout_cubit.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/resoruces/app_colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (ShopLayoutCubit.get(context).homeModel == null) {
          ShopLayoutCubit.get(context).getHomeData();
          return Center(child: CircularProgressIndicator());
        } else {
          return productBuilder(ShopLayoutCubit.get(context).homeModel!);
        }
      },
    );
  }
}

Widget productBuilder(HomeModel model) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
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
                return getGritProduct(model, index);
              }),
            ),
          ),
        )
      ],
    ),
  );
}

Widget getGritProduct(model, index) {
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
                padding: const EdgeInsets.symmetric(horizontal: 5 ),
                child: Text(
                  "discount",
                  style:TextStyle(
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
        Row(
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
            IconButton(
              icon:Icon(Icons.favorite_border),
              onPressed: (){

              },
            )
          ],


        ),
      ],
    ),
  );
}
