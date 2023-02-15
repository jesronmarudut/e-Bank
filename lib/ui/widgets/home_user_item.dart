import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUserItem extends StatelessWidget {
  final String imageUrl;
  final String username;

  const HomeUserItem({
    Key? key,
    required this.imageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
          // Border
          // border: Border.all(width: 0.1),
          // borderRadius: BorderRadius.circular(5),
          // color: whiteColor,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 55,
            height: 55,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          Text(
            '@$username',
            style: greyTextStyle3.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
