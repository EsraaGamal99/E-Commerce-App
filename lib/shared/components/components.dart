import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextButton({
  @required Function onPressed,
  @required String text,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultButton({
  @required Function onPressed,
  @required String text,
  double Width = double.infinity,
  double height = 50.0,
  Color backgroundColor = Colors.blueGrey,
  double radius = 15.0,
  bool isUpperCase = false,
}) =>
    Container(
      width: Width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) => false);
}

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void showToast({
  @required String msg,
  @required color
}
    ){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
    textColor: color,
    fontSize: 16.0,
  );
}