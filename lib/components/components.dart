import 'package:flutter/material.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    // save the last route or note
        (route) => false);

Widget defaultTextFormField({
  required TextEditingController controller,
  required String? Function(String? value) validator,
  required TextInputType inputType,
  required String label,
  bool? enabled,
  IconData? prefix,
  IconData? suffix,
  Function()? onSuffixPressed,
  Function()? onTap,
  Function(String s)? onSubmit,
  bool isPassword = false,
  TextCapitalization textCapitalization = TextCapitalization.none,
}) =>
    TextFormField(
      enabled: enabled,
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      textCapitalization: textCapitalization,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 22
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300
        ),
        prefixIcon: Icon(
          prefix,
          color: const Color(0xffFF0000),
        ),
        suffixIcon: IconButton(icon: Icon(suffix),color: const Color(0xffFF0000), onPressed: onSuffixPressed),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xffF77474)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xffF77474)),
        ),
      ),
      validator: validator,
    );


Widget defaultButton({
  double width = double.infinity, // giv it default width but can edit later
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 5.0,
  required String text,
  required Function()? onPressed,
}) =>
    Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffEB4B4B),
            Color(0xffFBA8A8),
            //Color(0xffFECDCD),
            Color(0xffFFDCDC),
          ],
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
          ),
        ),
        onPressed: onPressed,
      ),
    );
Widget defaultTextButton(
    {required Function() function, required String text}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase(),
        style: const TextStyle(
          fontSize: 20,
            color: Color(0xffFF0000)
        ),
      ),
    );

Widget defaultCameraButton({
  double width = double.infinity, // giv it default width but can edit later
  Color background = Colors.blue,
  bool isUpperCase = true,
  required String text,
  required Function()? onPressed,
}) =>
    Container(
      width: width,
      height: 60,
      color: const Color(0xffFFA2A0),
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed,
      ),
    );