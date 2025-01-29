import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ItemWidget2 extends StatelessWidget {
  final String nameItems;
  final String number;
  final Color? colorText;
  final double? width;

  const ItemWidget2({
    super.key,
    required this.nameItems,
    required this.number,
    this.colorText,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2.0,
                color: Colors.black,
              ),
            ),
          ),
          child: Text(
            number,
            style: AppFonts.quicksand600(
              16,
              colorText ?? AppColors.grey500,
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
