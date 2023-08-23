
import 'package:dht/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


class Loading extends StatelessWidget {
  final Color? colors;

  const Loading({this.colors, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20,
        width: 25,
        child: LoadingIndicator(
          indicatorType: Indicator.lineSpinFadeLoader,
          colors: [colors ?? AppColors.black],
          strokeWidth: 2,
        ),
      ),
    );
  }
}


// class NoData extends StatelessWidget {
//   const NoData({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  const Center(child:Text("No available data",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 26,color: AppColors.black),));
//   }
// }
