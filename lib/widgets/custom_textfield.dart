import 'dart:ui';

import 'package:dht/utils/app_colors.dart';
import 'package:dht/utils/assets_path.dart';
import 'package:dht/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;
  final int maxLine;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final Color? textColor;
  final double? fontSize;
  final int? maxLength;
  final double? radius;
  final bool enabled;
  final bool isPassword;
  final FocusNode? focusNode;
  final String? hintText;
  final Color? hintTextColor;
  final double? hintFontSize;
  final FontWeight? hintTextWeight;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Offset? offset;
  final double? spreadRadius;
  final VoidCallback? onTap;
  final Color? enableColor;
  final Color? focusedColor;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget;
  final FormFieldValidator<String>? validator;
 final List<TextInputFormatter>? inputFormatters;

  CustomTextField({
    Key? key,
    this.spreadRadius,
    this.offset,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.maxLine = 1,
    this.maxLength,
    this.radius,
    this.fontSize,
    this.fillColor,
    this.textColor,
    this.isPassword = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.hintText,
    this.hintTextColor,
    this.hintFontSize,
    this.hintTextWeight,
    this.textAlign,
    this.textAlignVertical,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.enableColor,
    this.focusedColor,
    this.cursorColor,
    required this.controller,
    this.contentPadding,
    this.prefixWidget,
    this.readOnly = false,
  }) : super(key: key);

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius ?? 10),
      child: ValueListenableBuilder(
          valueListenable: _isObscure,
          builder: (context, bool isObscure, _) {
            if (!isPassword) {
              isObscure = false;
            }
            return IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.boxShadowColor.withOpacity(0.15),
                      offset: offset?? const Offset(
                        2.0,
                        10.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: spreadRadius??2.0,
                    ),
                  ],
                ),
                child: TextFormField(
                  readOnly: readOnly,
                  style: TextStyle(
                    color: textColor ?? AppColors.black,
                    fontSize: fontSize ?? SizeUtils.fSize_14(),
                    fontWeight: FontWeight.w400,
                  ),
                  onTap: onTap,
                  obscureText: isObscure,
                  obscuringCharacter: '*',
                  onChanged: onChanged,
                  controller: controller,
                  maxLines: maxLine,
                  maxLength: maxLength,
                  keyboardType: keyboardType,
                  focusNode: focusNode,
                  textAlignVertical: textAlignVertical,
                  cursorColor: cursorColor ?? AppColors.black,
                  textAlign: textAlign ?? TextAlign.start,
                  enabled: enabled,
                  validator: validator,
                  inputFormatters: inputFormatters,
                  decoration: InputDecoration(
                    prefix: prefixWidget,
                    contentPadding: contentPadding ??
                        EdgeInsets.symmetric(
                            horizontal: SizeUtils.horizontalBlockSize * 6,
                            vertical: SizeUtils.verticalBlockSize * 2),
                    isDense: true,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon == null && isPassword
                        ? IconButton(
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                              size: SizeUtils.verticalBlockSize * 2.6,
                            ),
                            onPressed: () {
                              _isObscure.value = !isObscure;
                            },
                          )
                        : suffixIcon,
                    counterText: "",
                    // contentPadding: const EdgeInsets.all(12),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontFamily: AssetsPath.robotoFonts,
                      color: hintTextColor ?? AppColors.textColor,
                      fontSize: hintFontSize ?? SizeUtils.fSize_14(),
                      fontWeight: hintTextWeight ?? FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: fillColor ?? AppColors.white,
                    disabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 10)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 10)),
                      borderSide:
                          BorderSide(color: enableColor ?? Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 10)),
                      borderSide:
                          BorderSide(color: focusedColor ?? Colors.transparent),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
