import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/shared/shared_methods.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      //? Kondisi Logout
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/sign-in',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          //? Kondisi jika Success
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 100),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                  decoration: BoxDecoration(
                    color: warnaGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: state.user.profilePicture ==
                                      null //?Untuk ganti profile
                                  ? const AssetImage('assets/img_profile.png')
                                  : NetworkImage(
                                      state.user.profilePicture!,
                                    ) as ImageProvider),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: warnaPutih,
                                  ),
                                  child: Center(
                                    child: Icon(Icons.check_circle,
                                        color: warnaHijau, size: 24),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.user.name.toString(),
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 40),
                      ProfileMenuItem(
                          iconUrl: 'assets/ic_edit_profile.png',
                          title: 'Edit Profile',
                          onTap: () async {
                            if (await Navigator.pushNamed(context, '/pin') ==
                                true) {
                              Navigator.pushNamed(context, '/profile-edit');
                            }
                          }),
                      ProfileMenuItem(
                          iconUrl: 'assets/ic_pin.png',
                          title: 'My PIN',
                          onTap: () async {
                            if (await Navigator.pushNamed(context, '/pin') ==
                                true) {
                              Navigator.pushNamed(context, '/profile-edit-pin');
                            }
                          }),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_wallet.png',
                        title: 'Wallet Settings',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_reward.png',
                        title: 'My Rewards',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_help.png',
                        title: 'Help Center',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_logout.png',
                        title: 'Logout',
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 87),
                CustomTextButton(
                  title: 'Report a Problem',
                  onPressed: () {},
                ),
                const SizedBox(height: 50),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
