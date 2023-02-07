// import 'dart:async';
import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/shared/theme.dart';
// import 'package:bank/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//? Untuk melakukan timer pada splash page
// @override
// void initState() {
//   Timer(const Duration(seconds: 2), () {
//     Navigator.pushNamedAndRemoveUntil(
//         context, '/onboarding', (route) => false);
//   });
// }

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/onboarding', (route) => false);
          }
        },
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_logo_dark.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
