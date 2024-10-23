
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';


class RoomCard extends StatelessWidget {
  const RoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        image: const DecorationImage(
          image: AssetImage(AppImages.bg),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.black,
            AppColors.black.withOpacity(0.1),
          ],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Living Room',
          ),
          SizedBox(height: 4),
          Text(
            '10 Devices',
          )
        ],
      ),
    );
  }
}
