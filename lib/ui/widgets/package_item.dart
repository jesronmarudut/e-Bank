import 'package:bank/shared/shared_methods.dart';
import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  final int amount;
  final int price;
  final bool isSelected;

  const PackageItem({
    Key? key,
    required this.amount,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 176,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: warnaGrey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? warnaGrey3 : warnaGrey2,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 13),
          Text(
            '${amount}GB',
            style: whiteTextStyle.copyWith(
              fontSize: 32,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(price),
            style: greyTextStyle3.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
