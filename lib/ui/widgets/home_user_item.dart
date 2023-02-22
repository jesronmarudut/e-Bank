import 'package:bank/models/user_model.dart';
import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

// ? Statis
// class HomeUserItem extends StatelessWidget {
//   final String imageUrl;
//   final String username;

//   const HomeUserItem({
//     Key? key,
//     required this.imageUrl,
//     required this.username,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 90,
//       height: 120,
//       margin: const EdgeInsets.only(right: 10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 55,
//             height: 55,
//             margin: const EdgeInsets.only(bottom: 13),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   imageUrl,
//                 ),
//               ),
//             ),
//           ),
//           Text(
//             '@$username',
//             style: greyTextStyle.copyWith(
//               fontSize: 12,
//               fontWeight: medium,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ? Dinamis
class HomeUserItem extends StatelessWidget {
  final UserModel user;

  const HomeUserItem({
    Key? key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: user.profilePicture == null
                    ? const AssetImage(
                        'assets/img_profile.png',
                      )
                    : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          Text(
            // '@${user.name}',
            user.name.toString(),
            style: greyTextStyle.copyWith(
              fontSize: 13,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
