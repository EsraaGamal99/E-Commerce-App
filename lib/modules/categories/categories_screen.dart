import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/app_cubit/cubit.dart';
import 'package:shop_app/layout/app_cubit/states.dart';
import 'package:shop_app/models/categories_model.dart';


class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){},
      builder: (context, state) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildCategoryItem(AppCubit.get(context).categoriesModel!.data!.dataModel[index],),
            separatorBuilder: (context, index) => Divider(),
            itemCount: AppCubit.get(context).categoriesModel!.data!.dataModel.length,);
      }, );
  }
}
Widget buildCategoryItem(DataModel model) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Image(image: NetworkImage(model.image!),
          height: 90.0,
          width: 90.0,
      fit: BoxFit.cover),
      SizedBox(width: 10.0,),
      Text(model.name!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),),
      Spacer(),
      Icon(Icons.arrow_forward_ios),
    ],
  ),
);