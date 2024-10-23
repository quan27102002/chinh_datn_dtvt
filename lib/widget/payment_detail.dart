
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const PaymentDetailRow(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.greyFrame,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  icon,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(fontSize: 20)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
