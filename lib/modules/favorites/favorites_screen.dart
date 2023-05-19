import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/app_cubit/cubit.dart';
import 'package:shop_app/layout/app_cubit/states.dart';
import 'package:shop_app/models/favorites_model.dart';

import '../../shared/style/colors.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildFavItem(
              AppCubit.get(context).favoritesModel.data.data[index], context),
          separatorBuilder: (context, index) => Divider(),
          itemCount: AppCubit.get(context).favoritesModel.data.data.length,
        );
      },
    );
  }
}

Widget buildFavItem(FavoritesData model, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.product.image),
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                  if (model.product.discount != 0)
                    Container(
                      color: Colors.redAccent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: Text(
                          'DISCOUNT',
                          style: TextStyle(
                            fontSize: 8.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.3,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text('${model.product.price.round()}',
                            style: TextStyle(
                              color: defaultColor,
                              fontSize: 12.0,
                            )),
                        SizedBox(
                          width: 10.0,
                        ),
                        if (model.product.discount != 0)
                          Text(
                            '${model.product.oldPrice}',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12.0,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            AppCubit.get(context)
                                .changeFavorite(model.product.id);
                          },
                          icon: CircleAvatar(
                            backgroundColor: AppCubit.get(context)
                                    .favorites[model.product.id]
                                ? favColor
                                : defaultColor,
                            radius: 15.0,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 17.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
