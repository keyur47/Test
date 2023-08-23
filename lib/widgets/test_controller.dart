// import 'dart:developer';
//
// import 'package:dht/helper/debounce_helper.dart';
// import 'package:dht/utils/strings_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// import '../../../utils/styles.dart';
//
// class TestController extends GetxController{
//   // final DateRangePickerController controller = DateRangePickerController();
//   // final DateRangePickerSelectionMode selectionMode = DateRangePickerSelectionMode.range;
//   // final DateRangePickerController greenController = DateRangePickerController();
//   // RxList<String> availableDateTimeModelStringList = <String>[].obs;
//   // RxList<String> unavailableDateTimeModelStringList = <String>[].obs;
//   // TextEditingController commentsTextEditingController = TextEditingController();
//   // TextEditingController selectedDateController = TextEditingController();
//   // DateTime now = DateTime.now();
//   // RxBool isSelectionChange = false.obs;
//   // RxBool isViewChange = false.obs;  final DeBouncer deBouncer = DeBouncer(milliseconds: 400);
//   //
//   // RxInt daysInMonth = 0.obs;
//   // RxList<Widget> timeTextField = <Widget>[].obs;
//   //
//   // Rx<DateTimeRange> dateRange = DateTimeRange(
//   //   start: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
//   //   end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
//   // ).obs;
//   // Rx<DateTimeRange> monthChangeFirstAndLAstDateRange = DateTimeRange(
//   //   start: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
//   //   end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
//   // ).obs;
//   //
//   // DateTime? chosenDateTime;
//   //
//   // @override
//   // void onInit() {
//   //   firstDate(now);
//   //   lastDate(now);
//   //   // scheduleGreenActivity(fromDate: firstDate(now), toDate: lastDate(now));
//   //   // scheduleRedActivity(fromDate: firstDate(now), toDate: lastDate(now));
//   //   controller.view = DateRangePickerView.month;
//   //   greenController.view = DateRangePickerView.month;
//   //   controller.selectedDate = DateTime(2021, 9, 5);
//   //   greenController.selectedDate = DateTime(2021, 9, 5);
//   //   super.onInit();
//   // }
//   // void selectionChanged(DateRangePickerSelectionChangedArgs args) async {
//   //   if (args.value is PickerDateRange) {
//   //   } else if (args.value is DateTime) {
//   //     if (isViewChange.value == false) {
//   //       await deBouncer.run(() async {
//   //         final DateTime selectedDate = args.value;
//   //         String selectedDateStr = DateFormat('dd, MMMM yyyy').format(selectedDate).toString();
//   //         bool? isContain = greenController.selectedRanges?.any((element) {
//   //           isSelectionChange.value = true;
//   //           String startDate =
//   //           DateFormat('dd, MMMM yyyy').format(element.startDate ?? DateTime.now()).toString();
//   //           String endDate =
//   //           DateFormat('dd, MMMM yyyy').format(element.endDate ?? DateTime.now()).toString();
//   //           return ((startDate == selectedDateStr) || (endDate == selectedDateStr));
//   //         });
//   //         isContain ??= false;
//   //         isSelectionChange.value = false;
//   //         // if (isContain == false) {
//   //         //   isSelectionChange.value = true;
//   //         //   await scheduleRedActivity(
//   //         //     fromDate: firstDate(selectedDate),
//   //         //     toDate: lastDate(selectedDate),
//   //         //     selectedDateMiles: dateInMillisecondsSinceEpoch(selectedDate, StringsUtils.ddMmYy),
//   //         //   );
//   //         //   isSelectionChange.value = false;
//   //         //   await changeUnAvailability(selectedDate);
//   //         // }
//   //         isSelectionChange.value = false;
//   //       });
//   //     }
//   //   }
//   // }
//   //
//   // // Future scheduleGreenActivity({required int fromDate, required int toDate}) async {
//   // //   try {
//   // //     driverScheduleModel.value =
//   // //     await ScheduleService.getDriveActivityData(fromDate: fromDate, toDate: toDate);
//   // //     if (driverScheduleModel.value.apiresponse != null) {
//   // //       List<PickerDateRange> scheduledDetailsListGreen = <PickerDateRange>[];
//   // //       for (var element in driverScheduleModel.value.apiresponse!.data!.scheduledDetails!) {
//   // //         DateTime date1 = DateTime.fromMillisecondsSinceEpoch(element.fromDate!);
//   // //         DateTime date2 = DateTime.fromMillisecondsSinceEpoch(element.toDate!);
//   // //         scheduledDetailsListGreen.add(
//   // //           PickerDateRange(date1, date2),
//   // //         );
//   // //         availableDateTimeModelStringList
//   // //             .add(displayTimeAndDateTimestamp(element.fromDate ?? 0, StringsUtils.ddMmYyy));
//   // //         availableDateTimeModelStringList
//   // //             .add(displayTimeAndDateTimestamp(element.toDate ?? 0, StringsUtils.ddMmYyy));
//   // //       }
//   // //       greenController.selectedRanges = scheduledDetailsListGreen;
//   // //       availableDateTimeModelStringList.value = availableDateTimeModelStringList.toSet().toList();
//   // //       print("time model value---->${availableDateTimeModelStringList.value}");
//   // //     }
//   // //   } catch (e) {
//   // //     log("driverActivity error-->$e");
//   // //     rethrow;
//   // //   }
//   // // }
//   //
//   //
//   // void viewChanged(DateRangePickerViewChangedArgs args) {
//   //   dateRange.value = DateTimeRange(
//   //       start: DateTime(args.visibleDateRange.startDate!.year,
//   //           args.visibleDateRange.startDate!.month, args.visibleDateRange.startDate!.day),
//   //       end: DateTime(args.visibleDateRange.startDate!.year, args.visibleDateRange.startDate!.month,
//   //           args.visibleDateRange.startDate!.day));
//   //   monthChangeFirstAndLAstDateRange.value = DateTimeRange(
//   //       start: DateTime(args.visibleDateRange.startDate!.year,
//   //           args.visibleDateRange.startDate!.month, args.visibleDateRange.startDate!.day),
//   //       end: DateTime(args.visibleDateRange.endDate!.year, args.visibleDateRange.endDate!.month,
//   //           args.visibleDateRange.endDate!.day));
//   //   isViewChange.value = true;
//   //   SchedulerBinding.instance.addPostFrameCallback((duration) async {
//   //     unavailableDateTimeModelStringList.clear();
//   //     availableDateTimeModelStringList.clear();
//   //     daysInMonth.value = (((args.visibleDateRange.endDate
//   //         ?.difference(args.visibleDateRange.startDate ?? DateTime.now())
//   //         .inDays) ??
//   //         0) +
//   //         1);
//   //     // await scheduleGreenActivity(
//   //     //     fromDate: firstDate(args.visibleDateRange.startDate ?? DateTime.now()),
//   //     //     toDate: lastDate(args.visibleDateRange.endDate ?? DateTime.now()));
//   //     // await scheduleRedActivity(
//   //     //     fromDate: firstDate(args.visibleDateRange.startDate ?? DateTime.now()),
//   //     //     toDate: lastDate(args.visibleDateRange.endDate ?? DateTime.now()));
//   //     isViewChange.value = false;
//   //   });
//   // }
//   //
//   //
//   // Widget days(DateRangePickerCellDetails cellDetails) {
//   //   DateTime date = cellDetails.date;
//   //   if (controller.view == DateRangePickerView.month) {
//   //     return Center(
//   //         child: Text(cellDetails.date.day.toString(), style: AppTextStyle.bodyRegular[15]));
//   //   } else if (controller.view == DateRangePickerView.year) {
//   //     return Center(
//   //         child:
//   //         Text(DateFormat.MMMM().format(date).toString(), style: AppTextStyle.bodyRegular[24]));
//   //   } else if (controller.view == DateRangePickerView.decade) {
//   //     return Center(
//   //         child: Text(cellDetails.date.year.toString(),
//   //             style: AppTextStyle.bodyRegular[15], textAlign: TextAlign.center));
//   //   } else {
//   //     final int yearValue = (cellDetails.date.year ~/ 10) * 10;
//   //     return Center(
//   //       child: Text('$yearValue - ${yearValue + 10}',
//   //           style: AppTextStyle.bodyRegular[15]),
//   //     );
//   //   }
//   // }
//   //
//   //
//   //
//   // String displayTimeAndDateTimestamp(int time, String format) {
//   //   DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
//   //   String result = '';
//   //   final DateFormat formatter = DateFormat(format);
//   //   result = formatter.format(date);
//   //   return result;
//   // }
//   //
//   // firstDate(DateTime selectionModeDateTime) {
//   //   DateTime firstDayOfMonth = DateTime(selectionModeDateTime.year, selectionModeDateTime.month, 1);
//   //   var last = dateInMillisecondsSinceEpoch(firstDayOfMonth, StringsUtils.ddMmYy);
//   //   print("deleteSchedule ----firstDate$last");
//   //   return last;
//   // }
//   //
//   // lastDate(DateTime selectionModeDateTime) {
//   //   DateTime lastDayOfMonth =
//   //   DateTime(selectionModeDateTime.year, selectionModeDateTime.month + 1, 0);
//   //   var first = dateInMillisecondsSinceEpoch(lastDayOfMonth, StringsUtils.ddMmYy);
//   //   print("deleteSchedule ----firstDate$first");
//   //   return first;
//   // }
//   //
//   // int dateInMillisecondsSinceEpoch(DateTime date, String format) {
//   //   String result = '';
//   //   final DateFormat formatter = DateFormat(format);
//   //   result = formatter.format(date);
//   //   DateTime parseDate = DateFormat(format).parse(result);
//   //   log("parseDate $parseDate");
//   //   return parseDate.millisecondsSinceEpoch;
//   // }
// }