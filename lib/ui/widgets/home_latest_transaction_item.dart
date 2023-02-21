import 'package:bank/models/transaction_model.dart';
import 'package:bank/shared/shared_methods.dart';
import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ? Versi Statis
// class HomeLatestTransactionItem extends StatelessWidget {
//   final String iconUrl;
//   final String title;
//   final String time;
//   final String value;

//   const HomeLatestTransactionItem({
//     Key? key,
//     required this.iconUrl,
//     required this.title,
//     required this.time,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 18),
//       child: Row(
//         children: [
//           Image.asset(iconUrl, width: 48),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: whiteTextStyle.copyWith(
//                     fontSize: 16,
//                     fontWeight: medium,
//                   ),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   time,
//                   style: greyTextStyle.copyWith(
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             value,
//             style: greenTextStyle.copyWith(
//               fontSize: 16,
//               fontWeight: medium,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ? Dinamis
class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({
    Key? key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.network(transaction.transactionType!.thumbnail!, width: 48),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  // DateFormat('MMM dd').format(transaction.createdAt ?? DateTime.now()),
                  dateToMonthDate(DateTime.parse(transaction.createdAt!)),
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(transaction.amount ?? 0,
                symbol:
                    transaction.transactionType!.action == 'cr' ? '+ ' : '- '),
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
