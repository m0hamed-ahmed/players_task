import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/core/cubit/cubit.dart';
import 'package:players_task/core/cubit/states.dart';
import 'package:players_task/core/resources/colors_manager.dart';
import 'package:players_task/core/resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextDirection textDirection;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color? cursorColor;
  final bool autofocus;
  final int? maxLength;
  final int? maxLines;
  final bool obscureText;
  final TextStyle? style;
  final Color? textColor;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final double borderRadius;
  final Color? borderColor;
  final Color errorBorderColor;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double verticalPadding;
  final Color? fillColor;
  final Color? hintColor;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double prefixPadding;
  
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.textDirection = TextDirection.ltr,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor,
    this.autofocus = false,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.style,
    this.textColor,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.borderRadius = SizeManager.s50,
    this.borderColor,
    this.errorBorderColor = ColorsManager.darkRed,
    this.labelText,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.contentPadding,
    this.verticalPadding = SizeManager.s20,
    this.fillColor,
    this.hintColor = ColorsManager.grey,
    this.labelColor = ColorsManager.grey,
    this.labelFontWeight,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixPadding = SizeManager.s10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return TextFormField(
          controller: controller,
          textDirection: textDirection,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          cursorColor: cursorColor ?? (cubit.isLight ? ColorsManager.black : ColorsManager.white),
          autofocus: autofocus,
          maxLength: maxLength,
          maxLines: maxLines,
          obscureText: obscureText ? true : false,
          style: style ?? Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor ?? (cubit.isLight ? ColorsManager.black : ColorsManager.white)),
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          onTap: controller == null ? null : () {
            if(controller!.selection == TextSelection.fromPosition(TextPosition(offset: controller!.text.length -1))) {
              controller!.selection = TextSelection.fromPosition(TextPosition(offset: controller!.text.length));
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (cubit.isLight ? ColorsManager.grey2 : ColorsManager.darkColor), width: SizeManager.s1)),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (cubit.isLight ? ColorsManager.grey2 : ColorsManager.darkColor), width: SizeManager.s1)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (cubit.isLight ? ColorsManager.grey2 : ColorsManager.darkColor), width: SizeManager.s1)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (cubit.isLight ? ColorsManager.grey2 : ColorsManager.darkColor), width: SizeManager.s1)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: errorBorderColor, width: SizeManager.s1)),
            focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: errorBorderColor, width: SizeManager.s1)),
            contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: suffixIcon != null ? SizeManager.s0 : SizeManager.s10, vertical: verticalPadding),
            filled: true,
            fillColor: fillColor ?? (cubit.isLight ? ColorsManager.grey1 : ColorsManager.darkColor),
            hintText: hintText,
            labelText: labelText,
            hintStyle: hintStyle ?? Theme.of(context).textTheme.titleSmall!.copyWith(color: hintColor),
            labelStyle: labelStyle ?? Theme.of(context).textTheme.titleSmall!.copyWith(color: labelColor, fontWeight: labelFontWeight),
            errorStyle: errorStyle ?? Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorsManager.darkRed),
            prefixIcon: prefixIcon != null ? Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(SizeManager.s20, SizeManager.s0, SizeManager.s0, SizeManager.s0),
              child: prefixIcon,
            ) : null,
            suffixIcon: suffixIcon != null ? Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(SizeManager.s0, SizeManager.s0, SizeManager.s10, SizeManager.s0),
              child: suffixIcon,
            ) : null,
            prefix: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(prefixPadding, SizeManager.s0, SizeManager.s0, SizeManager.s0),
            ),
          ),
        );
      }
    );
  }
}