import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';

class QuickAction extends StatelessWidget {
  final String action;
  const QuickAction({
    super.key,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.kPrimary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.sunny, size: 24, color: AppColors.white),
              const SizedBox(width: 4),
              Text(
                action,
                style: AppFonts.quicksandMedium500(
                  14,
                  AppColors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '6:00 AM',
            style: AppFonts.quicksandMedium500(
              14,
              AppColors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '5 Devices',
            style: AppFonts.quicksandMedium500(
              14,
              AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
