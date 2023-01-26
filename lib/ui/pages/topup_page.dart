import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank/models/payment_method_model.dart';
import 'package:bank/models/topup_form_model.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/pages/topup_amount_page.dart';
import 'package:bank/ui/widgets/bank_item.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({Key? key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: warnaBiru,
        title: const Text('Top Up'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is AuthSuccess) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 30),
              Text(
                'Wallet',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset('assets/img_wallet.png', width: 80, height: 55),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //? replaceAllMapped untuk memberikan spasi
                        state.user.cardNumber!.replaceAllMapped(
                            RegExp(r".{4}"), (match) => "${match.group(0)}  "),
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        state.user.name.toString(),
                        style: whiteTextStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Select Bank',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 14),
              BlocProvider(
                create: (context) =>
                    PaymentMethodBloc()..add(PaymentMethodGet()),
                child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                  builder: (context, state) {
                    if (state is PaymentMethodSuccess) {
                      return Column(
                        children: state.paymentMethods.map((paymentMethod) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPaymentMethod = paymentMethod;
                              });
                            },
                            child: BankItem(
                              paymentMethod: paymentMethod,
                              isSelected:
                                  paymentMethod.id == selectedPaymentMethod?.id,
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
              const SizedBox(height: 12),
              //? button tidak muncul jika belum di pilih
              if (selectedPaymentMethod != null)
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopupAmountPage(
                          data: TopupFormModel(
                              paymentMethodCode: selectedPaymentMethod?.code),
                        ),
                      ),
                    );
                  },
                ),
              const SizedBox(height: 57),
            ],
          );
        }
        return Scaffold();
      }),
    );
  }
}
