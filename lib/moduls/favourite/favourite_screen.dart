import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/shop_cubit/shop_layout_cubit.dart';
import 'package:shop_app/models/favorite_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (ShopLayoutCubit.get(context).favoriteModel == null) {
          ShopLayoutCubit.get(context).getFavoritesScreen();
          return Center(child: CircularProgressIndicator());
        } else {
          FavoriteModel favoriters = ShopLayoutCubit.get(context).favoriteModel!;
          return ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return getItem(favoriters.data.data[index],index,context);
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: favoriters.data.data.length,
            physics: BouncingScrollPhysics(),
          );
        }
      },
    );
  }
}

Widget getItem(Data model,index,context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      height: 120,
      child: Row(children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [

            Image.network(
              model.product.image,
              fit: BoxFit.fill,
              width: 120,
              height: 120,
            ),
            if (model.product.discount != null)
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
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 14, height: 1.3),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      model.product.price.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, height: 1.3, color: Colors.blue),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (model.product.discount != null)
                      Text(
                        model.product.oldPrice.toString(),
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
                            .favourites[model.product.id] ?? false) ? Colors
                            .red : Colors.grey,),
                        onPressed: () {
                          ShopLayoutCubit.get(context).changeFavourite(
                              model.product.id);
                          print(model.product.id);
                        },
                      ),
                    )
                  ],


                ),
              ),
            ],
          ),
        ),

      ],),
    ),
  );
}