import 'package:flutter/material.dart';
import 'package:taskati/core/app_color.dart';

customError(context,text){
   
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: appColors.redColor,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      content: Text(text)));
}