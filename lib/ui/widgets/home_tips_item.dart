import 'package:bank/models/tip_model.dart';
import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// ? Static
// class HomeTipsItem extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String url;

//   const HomeTipsItem({
//     Key? key,
//     required this.imageUrl,
//     required this.title,
//     required this.url,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         if (await canLaunch(url)) {
//           launch(url);
//         }
//       },
//       child: Container(
//         width: 220,
//         height: 176,
//         decoration: BoxDecoration(
//           border: Border.all(width: 0.1),
//           borderRadius: BorderRadius.circular(5),
//           color: background2,
//         ),
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(5),
//               ),
//               child: Image.asset(
//                 imageUrl,
//                 width: 220,
//                 height: 120,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 12,
//               ),
//               child: Text(
//                 title,
//                 style: whiteTextStyle.copyWith(
//                   fontWeight: medium,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeTipsItem extends StatelessWidget {
  final TipsModel tips;

  const HomeTipsItem({
    Key? key,
    required this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(tips.url.toString())) {
          launch(tips.url.toString());
        }
      },
      child: Container(
        width: 220,
        height: 176,
        decoration: BoxDecoration(
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(5),
          color: background2,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(5),
              ),
              child: Image.network(
                tips.thumbnail.toString(),
                width: 220,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                tips.title.toString(),
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
