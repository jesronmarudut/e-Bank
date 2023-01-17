import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String time;
  final String value;

  const HomeLatestTransactionItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.time,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(iconUrl, width: 48),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: yellowTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: greenTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
