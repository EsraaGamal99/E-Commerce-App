import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/app_cubit/cubit.dart';
import 'package:shop_app/layout/app_cubit/states.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/componentes/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Salla',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: cubit.appScreens[cubit.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeNavBarIndex(index);
            },

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home',),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined,),label: 'Categories',),
              BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: 'Favorites',),
              BottomNavigationBarItem(icon: Icon(Icons.settings,),label: 'Settings',),
            ],
          ),

        );

      },
    );
  }
}
