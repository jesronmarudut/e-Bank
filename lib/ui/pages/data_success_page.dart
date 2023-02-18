import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class DataSuccessPage extends StatelessWidget {
  const DataSuccessPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Top up Package Data\nSuccess',
            style: purpleTextStyle.copyWith(
              fontSize: 25,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/success.png',
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Use the money wisely and\ngrow your finance',
            style: greyTextStyle.copyWith(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          CustomFilledButton(
            width: 183,
            title: 'Back to Home',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            },
          )
        ],
      ),
    ));
  }
}
