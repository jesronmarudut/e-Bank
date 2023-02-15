// import 'package:bank/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank/models/payment_method_model.dart';
import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final PaymentMethodModel data;
  final bool isSelected;

  const BankItem({
    Key? key,
    required this.data,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 1,
          color: isSelected ? purpleColor : greyColor4,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            data.thumbnail!,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 mins',
                style: greenTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
