import 'package:e_commerce_app/models/payment_method_model.dart';
import 'package:e_commerce_app/utils/colors_app.dart';
import 'package:e_commerce_app/views/widgets/add_payment_card_widget.dart';
import 'package:e_commerce_app/views/widgets/payment_item_widget.dart';
import 'package:flutter/material.dart';

class PaymentModalBottomSheetWidget extends StatelessWidget {
  const PaymentModalBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              'Payment Method',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: savedCards.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PaymentItemWidget(
                  paymentMethod: savedCards[index],
                );
              },
            ),
            PaymentItemWidget(
              additionOnTap: () async {
                await showDialog<void>(
                    context: context,
                    builder: (ctx) => const AddPaymentCardWidget());
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: AppColors.white,
                ),
                child: const Text('Confirm Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
