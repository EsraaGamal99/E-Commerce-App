import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/app_cubit/cubit.dart';
import 'package:shop_app/layout/app_cubit/states.dart';
import '../../shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition:  AppCubit.get(context).favoritesModel!.data!.data!.length>0 && AppCubit.get(context).favorites.length>0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildListItem(AppCubit.get(context).favoritesModel!.data!.data![index].product, context,),
            separatorBuilder: (context, index) => Divider(),
            itemCount: AppCubit.get(context).favoritesModel!.data!.data!.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

