import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String hintText;
  final Function(DateTime?) onDateSelected;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;

  const AppDatePicker({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.hintText = 'Select Date',
    required this.onDateSelected,
    this.contentPadding,
    this.backgroundColor,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorsManager.primary,
              onPrimary: ColorsManager.white,
              surface: ColorsManager.white,
              onSurface: ColorsManager.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorsManager.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  String get _formattedDate {
    if (selectedDate == null) return widget.hintText;
    return DateFormat('dd MMM yyyy').format(selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? ColorsManager.textFieldBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _formattedDate,
                style: selectedDate == null
                    ? TextStyles.font14RegularLightGray
                    : TextStyles.font14RegularBlack,
              ),
            ),
            Icon(
              Icons.calendar_today,
              color: ColorsManager.mediumGray,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
