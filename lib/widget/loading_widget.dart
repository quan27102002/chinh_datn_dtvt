import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   constraints: const BoxConstraints.expand(),
    //   color: AppThemes.black.withOpacity(0.6),
    //   child: const Center(
    //       child: SpinKitFadingCircle(
    //     color: Colors.white,
    //     size: 50,
    //   )),
    // );
    return Container(
      constraints: const BoxConstraints.expand(),
      color: AppColors.black.withOpacity(0.6),
      child: Center(
          child: Stack(
        children: [
          const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary600,
              )),
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppImages.logoEV),
          )),
        ],
      )),
    );
  }
}
