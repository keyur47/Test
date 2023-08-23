import 'package:dht/utils/app_colors.dart';
import 'package:dht/utils/assets_path.dart';
import 'package:dht/utils/size_utils.dart';
import 'package:flutter/material.dart';

Widget createButton({
  String? text,
  required VoidCallback onTap,
  Color? buttonColor,
  Color? textColor,
  double? fontSize,
  Widget? customText,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor ?? AppColors.orange,
        borderRadius:
            BorderRadius.circular(SizeUtils.horizontalBlockSize * 3),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeUtils.verticalBlockSize * 1.8,
        ),
        child: Center(
          child: customText ??
              Text(
                "$text",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AssetsPath.robotoFonts,
                  color: textColor ?? AppColors.white,
                  fontSize: fontSize ??SizeUtils.fSize_14(),
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),
    ),
  );
}
