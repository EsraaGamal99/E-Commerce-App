import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/app_cubit/cubit.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/search_cubit/cubit.dart';
import 'package:shop_app/modules/search/search_cubit/states.dart';
import '../../layout/app_cubit/states.dart';
import '../../shared/components/components.dart';


class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ProductModel? model;

  @override
  Widget build(BuildContext context, ) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      defaultFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter text to search';
                          }
                          return null;
                        },
                        label: 'Search',
                        prefix: Icons.search,
                      onSubmit:  (text){
                        if (formKey.currentState!.validate())
                            SearchCubit.get(context).search(text);
                      }),
                      SizedBox(
                        height: 10.0,
                      ),
                      if (state is SearchLoadingState) LinearProgressIndicator(),
                      SizedBox(
                        height: 10.0,
                      ),

                      if (state is SearchSuccessState)
                        ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildListItem(
                              SearchCubit.get(context).searchModel!.data!.data![index], context,isOldPrice: false),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: SearchCubit.get(context).searchModel!.data!.data!.length,
                        )

                    ],
                  ),
                ),
              ),
            ),

          );
        },
      ),
    );
  }
}
