import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/topup/topup_bloc.dart';
import 'package:bank/blocs/transfer/transfer_bloc.dart';
import 'package:bank/models/transfer_form_model.dart';
import 'package:bank/shared/shared_methods.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferAmountPage extends StatefulWidget {
  final TransferFormModel data;
  const TransferAmountPage({
    Key? key,
    required this.data,
  });

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '')
            .format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text == '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deletePin() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
    print(amountController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: BlocProvider(
        create: (context) => TransferBloc(),
        child: BlocConsumer<TransferBloc, TransferState>(
          listener: (context, state) {
            if (state is TransferFailed) {
              showCustomSnackbar(context, state.e);
            }
            if (state is TransferSuccess) {
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(
                            amountController.text.replaceAll('.', ''),
                          ) *
                          -1,
                    ),
                  );
              Navigator.pushNamedAndRemoveUntil(
                  context, '/transfer-success', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is TransferLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 58,
              ),
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Total Amount',
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  ),
                ),
                const SizedBox(height: 67),
                Align(
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: amountController,
                      enabled: false,
                      cursorColor: whiteColor,
                      style: blackTextStyle.copyWith(
                          fontSize: 36, fontWeight: medium),
                      decoration: InputDecoration(
                        prefixIcon: Text(
                          'Rp ',
                          style: blackTextStyle.copyWith(
                            fontSize: 36,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 66),
                Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  children: [
                    CustomInputButton(
                      title: '1',
                      onTap: () {
                        addAmount('1');
                      },
                    ),
                    CustomInputButton(
                      title: '2',
                      onTap: () {
                        addAmount('2');
                      },
                    ),
                    CustomInputButton(
                      title: '3',
                      onTap: () {
                        addAmount('3');
                      },
                    ),
                    CustomInputButton(
                      title: '4',
                      onTap: () {
                        addAmount('4');
                      },
                    ),
                    CustomInputButton(
                      title: '5',
                      onTap: () {
                        addAmount('5');
                      },
                    ),
                    CustomInputButton(
                      title: '6',
                      onTap: () {
                        addAmount('6');
                      },
                    ),
                    CustomInputButton(
                      title: '7',
                      onTap: () {
                        addAmount('7');
                      },
                    ),
                    CustomInputButton(
                      title: '8',
                      onTap: () {
                        addAmount('8');
                      },
                    ),
                    CustomInputButton(
                      title: '9',
                      onTap: () {
                        addAmount('9');
                      },
                    ),
                    const SizedBox(width: 60, height: 60),
                    CustomInputButton(
                      title: '0',
                      onTap: () {
                        addAmount('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        deletePin();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: greyColor4,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      final authState = context.read<AuthBloc>().state;
                      String pin = '';
                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }
                      context.read<TransferBloc>().add(
                            TransferPost(
                              widget.data.copyWith(
                                pin: pin,
                                amount:
                                    amountController.text.replaceAll('.', ''),
                              ),
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextButton(
                  title: 'Terms & Conditions',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
