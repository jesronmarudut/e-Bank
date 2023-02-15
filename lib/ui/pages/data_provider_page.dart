import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/operator_card/operator_card_bloc.dart';
import 'package:bank/models/operator_card_model.dart';
import 'package:bank/shared/shared_methods.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/pages/topup_amount_page.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({Key? key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

OperatorCardModel? selectedOperatorCard;

class _DataProviderPageState extends State<DataProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Package'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          // 'Balance: ${formatCurrency(state.user.balance ?? 0)}',
                          formatCurrency(state.user.balance ?? 0),
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          BlocProvider(
            create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                if (state is OperatorCardSuccess) {
                  return Column(
                    children: state.operatorCards.map((operatorCard) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOperatorCard = operatorCard;
                          });
                        },
                        child: DataProviderItem(
                          operatorCard: operatorCard,
                          isSelected:
                              operatorCard.id == selectedOperatorCard?.id,
                        ),
                      );
                    }).toList(),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          const SizedBox(height: 57),
        ],
      ),
      floatingActionButton: (selectedOperatorCard != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataProviderPage(),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
