import 'package:bank/models/user_model.dart';
import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultUserItem extends StatelessWidget {
  final UserModel user;

  final bool isSelected;

  const TransferResultUserItem({
    Key? key,
    required this.user,
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
        color: background2,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: isSelected ? purpleColor : background2,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: user.profilePicture == null
                    ? const AssetImage('assets/img_profile.png')
                    : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
            ),
            child: user.verified == 1
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 14,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 13),
          Text(
            user.name.toString(),
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            // '@${user.username}',
            user.username.toString(),
            style: greyTextStyle.copyWith(
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
