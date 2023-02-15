import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 500,
            height: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/blankpage.gif',
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
