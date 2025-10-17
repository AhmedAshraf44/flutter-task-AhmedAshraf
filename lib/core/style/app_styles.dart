import 'package:flutter/material.dart';
import 'package:flutter_task/core/color/app_colors.dart';

abstract class AppStyles {
  static const textStyle16Bold = TextStyle(
    fontSize: 16,
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.w700,
    color: AppColors.kTextPrimary,
  );
  static const textStyle14Bold = TextStyle(
    fontSize: 14,
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.w700,
    color: AppColors.kTextPrimary,
  );
  static const textStyle24Medium = TextStyle(
    fontSize: 24,
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.w500,
    color: AppColors.kTextPrimary,
  );
  static const textStyle16Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextPrimary,
  );
  static const textStyle14Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextPrimary,
  );
  static const textStyle12Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextPrimary,
  );
  static const textStyle14Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.kTextPrimary,
  );
  static const textStyle12Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.kTextPrimary,
  );
  static const textStyle10Regular = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.kTextPrimary,
  );
}
