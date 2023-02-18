import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ProfileEditSuccessPage extends StatelessWidget {
  const ProfileEditSuccessPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile successfully updated.',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 26,
          ),
          Text(
            'Your data is safe with\n our system',
            style: greyTextStyle.copyWith(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          CustomFilledButton(
            width: 183,
            title: 'Back to Home',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main_page', (route) => false);
            },
          )
        ],
      ),
    ));
  }
}
