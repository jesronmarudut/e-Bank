import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/tip/tip_bloc.dart';
import 'package:bank/blocs/transaction/transactions_bloc.dart';
import 'package:bank/blocs/user/user_bloc.dart';
import 'package:bank/models/transfer_form_model.dart';
import 'package:bank/shared/shared_methods.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/pages/home/nav_history_page.dart';
import 'package:bank/ui/pages/transfer_amount_page.dart';
import 'package:bank/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank/ui/widgets/home_service_item.dart';
import 'package:bank/ui/widgets/home_tips_item.dart';
import 'package:bank/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> _children = [
    const HomePage(),
    // const BlankPage(),
  ];
  void onPressed(int Index) {
    setState(() {
      currentIndex = Index;
    });
  }

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTransactions(),
          buildSendAgain(),
          buildFriendlyTips(),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(
              top: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello,',
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold)),
                    // Text(state.user.name.toString(),
                    //     style: whiteTextStyle.copyWith(
                    //         fontSize: 16, fontWeight: medium)),
                    const SizedBox(height: 2),
                    Text(
                      state.user.name.toString(),
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    width: 50,
                    height: 50,
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
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            height: 220,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img_bg_card2.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user.name.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 25,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '**** **** **** ${state.user.cardNumber!.substring(12, 16)}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: bold,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your Total Balance',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  formatCurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                    fontSize: 25,
                    fontWeight: bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: background2,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 3',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                '35% ',
                style: purpleTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                formatCurrency(6923435),
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.35,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(purpleColor),
              backgroundColor: greyColor2,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: 'assets/ic_topup.png',
                title: 'Top Up',
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_send.png',
                title: 'Transfer',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const MoreDialog(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLatestTransactions() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transactions',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: background2,
            ),
            child: BlocProvider(
              create: (context) => TransactionsBloc()..add(TransactionGet()),
              child: BlocBuilder<TransactionsBloc, TransactionsState>(
                builder: (context, state) {
                  if (state is TransactionsSuccess) {
                    return Column(
                      children: state.transactions.map((transaction) {
                        return HomeLatestTransactionItem(
                            transaction: transaction);
                      }).toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Transaction',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 5),
          BlocProvider(
            create: (context) => UserBloc()..add(UserGetRecent()),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: state.users.map((user) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransferAmountPage(
                                data: TransferFormModel(
                                  sendTo: user.username,
                                ),
                              ),
                            ),
                          );
                        },
                        child: HomeUserItem(
                          user: user,
                        ),
                      );
                    }).toList()
                        // ? Statis
                        // HomeUserItem(
                        //   imageUrl: 'assets/img_friend1.png',
                        //   username: 'Jessica',
                        // ),
                        // HomeUserItem(
                        //   imageUrl: 'assets/img_friend2.png',
                        //   username: 'Steffani',
                        // ),
                        // HomeUserItem(
                        //   imageUrl: 'assets/img_friend3.png',
                        //   username: 'Michael',
                        // ),
                        // HomeUserItem(
                        //   imageUrl: 'assets/img_friend4.png',
                        //   username: 'David',
                        // ),
                        ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlocProvider(
              create: (context) => TipsBloc()..add(TipsGet()),
              child: BlocBuilder<TipsBloc, TipState>(
                builder: (context, state) {
                  if (state is TipsSuccess) {
                    return Wrap(
                        runSpacing: 18,
                        spacing: 17,
                        children: state.tips.map((tips) {
                          return HomeTipsItem(tips: tips);
                        }).toList()
                        // ! Untuk get data Tip
                        // state.tips.map((tip) {
                        //   return HomeTipsItem(tip: tip);
                        // }).toList()

                        //? Static
                        // [
                        //   HomeTipsItem(
                        //     imageUrl: 'assets/img_tips1.png',
                        //     title:
                        //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        //     url: 'https://www.google.com',
                        //   ),
                        //   HomeTipsItem(
                        //     imageUrl: 'assets/img_tips2.png',
                        //     title:
                        //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        //     url: 'https://www.google.com',
                        //   ),
                        //   HomeTipsItem(
                        //     imageUrl: 'assets/img_tips3.png',
                        //     title:
                        //         'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        //     url: 'https://www.google.com',
                        //   ),
                        //   HomeTipsItem(
                        //     imageUrl: 'assets/img_tips4.png',
                        //     title:
                        //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        //     url: 'https://www.google.com',
                        //   ),

                        // ],
                        );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({Key? key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326,
        padding: const EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: background1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 13),
            Wrap(
              spacing: 29,
              runSpacing: 20,
              children: [
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_data.png',
                  title: 'Data',
                  onTap: () {
                    Navigator.pushNamed(context, '/data-provider');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_water.png',
                  title: 'Water',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_stream.png',
                  title: 'Stream',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_movie.png',
                  title: 'Movie',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_food.png',
                  title: 'Food',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_travel.png',
                  title: 'Travel',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
