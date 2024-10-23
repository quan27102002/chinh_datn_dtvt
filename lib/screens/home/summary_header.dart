import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SummaryHeader extends StatelessWidget {
  final String temp;
  final String humi;
  const SummaryHeader({
    super.key,
    required this.temp,
    required this.humi,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // chuyển tab
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
          color: AppColors.kPrimary,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(
                'Temperature',
                style: AppFonts.quicksandMedium500(
                  16,
                  AppColors.white,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.thermostat,
                    size: 24,
                    color: AppColors.white,
                  ),
                  Text(
                    temp,
                    style: AppFonts.quicksandMedium500(
                      16,
                      AppColors.white,
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Text(
                'Humidity',
                style: AppFonts.quicksandMedium500(
                  16,
                  AppColors.white,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.water_drop_outlined,
                    size: 24,
                    color: AppColors.white,
                  ),
                  Text(
                    '$humi%',
                    style: AppFonts.quicksandMedium500(
                      16,
                      AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Energy Used',
                style: AppFonts.quicksandMedium500(
                  16,
                  AppColors.white,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.bolt_sharp,
                    size: 24,
                    color: AppColors.white,
                  ),
                  Text(
                    '250 KWh',
                    style: AppFonts.quicksandMedium500(
                      16,
                      AppColors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
