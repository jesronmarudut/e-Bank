import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Oops..\nPage Not Found',
            style: blackTextStyle.copyWith(
              fontSize: 25,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 350,
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/404-4.png',
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
