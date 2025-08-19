import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(height: height.h);

SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

double getWidth(BuildContext context) => MediaQuery.of(context).size.width.w;

double getHeight(BuildContext context) => MediaQuery.of(context).size.height.h;

const pagePadding = 10.0;
