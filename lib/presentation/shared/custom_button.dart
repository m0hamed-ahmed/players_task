import 'package:flutter/material.dart';
import 'package:players_task/core/resources/colors_manager.dart';
import 'package:players_task/core/resources/values_manager.dart';
import 'package:players_task/core/utils/extensions.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final double width;
  final double height;
  final Color? buttonColor;
  final double elevation;
  final double borderRadius;
  final bool isTextOnly;
  final bool isIconOnly;
  final bool isImageOnly;
  final String? text;
  final TextStyle? textStyle;
  final Color textColor;
  final FontWeight? textFontWeight;
  final Widget? preIcon;
  final Widget? postIcon;
  final Widget? icon;
  final IconData? preIconData;
  final IconData? postIconData;
  final IconData? iconData;
  final Color iconColor;
  final double iconSize;
  final String? preImage;
  final String? postImage;
  final String? image;
  final double imageSize;
  final Widget? preSpacerIcon;
  final Widget? postSpacerIcon;
  final IconData? preSpacerIconData;
  final IconData? postSpacerIconData;
  final String? preSpacerImage;
  final String? postSpacerImage;
  final double svgSize;
  final Color? imageColor;
  final Color? borderColor;

  const CustomButton({
    Key? key,
    this.onPressed,
    this.width = double.infinity,
    this.height = SizeManager.s50,
    this.buttonColor,
    this.elevation = SizeManager.s0,
    this.borderRadius = SizeManager.s16,
    this.isTextOnly = false,
    this.isIconOnly = false,
    this.isImageOnly = false,
    this.text,
    this.textStyle,
    this.textColor = ColorsManager.white,
    this.preIcon,
    this.postIcon,
    this.icon,
    this.preIconData,
    this.postIconData,
    this.iconData,
    this.iconColor = ColorsManager.white,
    this.iconSize = SizeManager.s18,
    this.preImage,
    this.postImage,
    this.image,
    this.imageSize = SizeManager.s20,
    this.preSpacerIcon,
    this.postSpacerIcon,
    this.preSpacerIconData,
    this.postSpacerIconData,
    this.preSpacerImage,
    this.postSpacerImage,
    this.svgSize = SizeManager.s10,
    this.imageColor,
    this.borderColor,
    this.textFontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width,
      height: height,
      color: buttonColor,
      elevation: elevation,
      hoverElevation: elevation,
      focusElevation: elevation,
      highlightElevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor??Colors.transparent),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(isTextOnly) Text(text!.toCapitalized(), style: const TextStyle(color: ColorsManager.white)),
          if(isIconOnly) icon ?? Icon(iconData!, color: iconColor, size: iconSize),
          if(isImageOnly) Image.asset(image!, width: imageSize, height: imageSize),

          if(preIcon != null || preIconData != null) Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                preIcon ?? Icon(preIconData!, color: iconColor, size: iconSize),
                const SizedBox(width: SizeManager.s10),
                Flexible(child: FittedBox(child: Text(text!))),
              ],
            ),
          ),

          if(postIcon != null || postIconData != null) Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: FittedBox(child: Text(text!))),
                const SizedBox(width: SizeManager.s10),
                postIcon ?? Icon(postIconData!, color: iconColor, size: iconSize),
              ],
            ),
          ),

          if(preImage != null || preImage != null) Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(preImage!, width: imageSize, height: imageSize),
                const SizedBox(width: SizeManager.s10),
                Flexible(child: FittedBox(child: Text(text!))),
              ],
            ),
          ),

          if(postImage != null || postImage != null) Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: FittedBox(child: Text(text!))),
                const SizedBox(width: SizeManager.s10),
                Image.asset(postImage!, width: imageSize, height: imageSize),
              ],
            ),
          ),

          if(preSpacerIcon != null || preSpacerIconData != null) Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                preSpacerIcon ?? Icon(preSpacerIconData, color: iconColor, size: iconSize),
                const SizedBox(width: SizeManager.s10),
                Flexible(child: FittedBox(child: Text(text!))),
              ],
            ),
          ),

          if(postSpacerIcon != null || postSpacerIconData != null) Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: FittedBox(child: Text(text!))),
                const SizedBox(width: SizeManager.s10),
                postSpacerIcon ?? Icon(postSpacerIconData, color: iconColor, size: iconSize),
              ],
            ),
          ),

          if(preSpacerImage != null) Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(preSpacerImage!, color: imageColor, width: imageSize, height: imageSize),
                const SizedBox(width: SizeManager.s10),
                Flexible(child: FittedBox(child: Text(text!))),
              ],
            ),
          ),

          if(postSpacerImage != null) Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: FittedBox(child: Text(text!))),
                const SizedBox(width: SizeManager.s10),
                Image.asset(postSpacerImage!, color: imageColor, width: imageSize, height: imageSize),
              ],
            ),
          ),
        ],
      ),
    );
  }
}