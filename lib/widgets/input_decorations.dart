import 'package:flutter/material.dart';
import 'package:taskwave/config/ui/colors.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color:AppColors.primary,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
             color: AppColors.primary,
            width: 2
          )
        ),
        hintText: hintText,
       
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.grey,
        ),
        prefixIcon: prefixIcon != null 
          ? Icon( prefixIcon, color: AppColors.primary,)
          : null
      );
  }  

}