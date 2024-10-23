import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String nameItems;
  final String number;
  final Color? colorText;

  const ItemWidget({
    super.key,
    required this.nameItems,
    required this.number,
    this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Colors.black,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            nameItems,
            style: AppFonts.quicksand700(
              16,
              AppColors.grey500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            number,
            style: AppFonts.quicksand600(
              16,
              colorText ?? AppColors.grey500,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
