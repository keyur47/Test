import 'dart:core';

import 'package:dht/utils/app_colors.dart';
import 'package:dht/utils/assets_path.dart';
import 'package:dht/utils/size_utils.dart';
import 'package:dht/utils/strings_utils.dart';
import 'package:dht/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget createAppbar({GestureTapCallback? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: SizeUtils.horizontalBlockSize * 8,
      ),
      AppText(
        text: StringsUtils.home,
        fontSize: SizeUtils.fSize_18(),
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      GestureDetector(
        onTap: onTap,
        child: Image.asset(
          AssetsPath.logout,
          scale: 3.5,
        ),
      )
    ],
  );
}

/// CustomAppBar
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    required this.onTap,
    required this.leadingIcon,
    this.Double,
    this.actions,
  }) : super(key: key);

  final String? title;
  final double? Double;
  final bool? leadingIcon;
  final GestureTapCallback? onTap;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: Double ?? 0.5,
      backgroundColor: AppColors.backgroundColor,
      leading: leadingIcon == true
          ? Padding(
              padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 5),
              child: GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  AssetsPath.backIcon,
                  scale: 3.4,
                ),
              ),
            )
          : SizedBox(),
      centerTitle: true,
      actions: actions,
      title: AppText(
        text: "$title",
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SizeUtils.verticalBlockSize * 6);
}


