import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:datn_trung/widget/touchable_widget.dart';

import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    this.titleButton,
    this.color,
    required this.onPressed,
    this.haveIcon = false,
    this.isButtonWhite = false,
    this.width,
  });
  final String? titleButton;
  final Color? color;
  final Function() onPressed;
  final bool haveIcon;
  final bool isButtonWhite;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return TouchableWidget(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: isButtonWhite
                ? Colors.white
                : haveIcon
                    ? Colors.white
                    : color ?? AppColors.kPrimary,
            border: isButtonWhite
                ? Border.all(width: 1, color: AppColors.kPrimary)
                : haveIcon
                    ? Border.all(width: 1, color: AppColors.kPrimary)
                    : Border.all(width: 2.5, color: AppColors.kPrimary),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11),
          child: !haveIcon
              ? Text(
                  titleButton ?? "Tạo đơn và giao hàng",
                  textAlign: TextAlign.center,
                  style: AppFonts.bold(
                    16,
                    isButtonWhite ? AppColors.kPrimary : color ?? Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.asset(
                        AppImages.logOutIc,
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        titleButton ?? "Lưu tạm",
                        textAlign: TextAlign.center,
                        style: AppFonts.bold(
                          16,
                          AppColors.kPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
