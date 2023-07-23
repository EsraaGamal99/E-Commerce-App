import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/app_cubit/cubit.dart';
import 'package:shop_app/layout/app_cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingsScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AppCubit.get(context).userDataModel;
        nameController.text = model!.data!.name!;
        emailController.text = model!.data!.email!;
        phoneController.text = model!.data!.phone!;

        return ConditionalBuilder(
          condition: AppCubit.get(context).userDataModel != null,
          builder: (context)=> SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is AppLoadingUpdateUserDataState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Name must not br empty';
                        }
                          return null;
                      },
                      label: 'Name',
                      prefix: Icons.person,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email must not br empty';
                        }
                          return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Phone number must not br empty';
                        }
                          return null;
                      },
                      label: 'Phone',
                      prefix: Icons.phone,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        defaultButton(
                          onPressed: () {
                            AppCubit.get(context).putUserData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                          },
                          text: 'Update',
                          Width: 100.0,
                        ),
                        Spacer(),
                        defaultButton(
                          onPressed: () {
                            signOut(context);
                          },
                          text: 'Logout',
                          Width: 100.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
