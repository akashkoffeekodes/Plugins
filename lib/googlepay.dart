import 'package:flutter/material.dart';
import 'package:pay/pay.dart';


class PaySampleApp extends StatefulWidget {
  PaySampleApp({Key key}) : super(key: key);

  @override
  _PaySampleAppState createState() => _PaySampleAppState();
}

class _PaySampleAppState extends State<PaySampleApp> {
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }
  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google pay'),
      ),
      backgroundColor: Colors.white,
      body:
      ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [

          GooglePayButton(
            paymentConfigurationAsset:
            'googlapi.json',
            paymentItems: _paymentItems,
            style: GooglePayButtonStyle.black,
            type: GooglePayButtonType.pay,
            margin: const EdgeInsets.only(top: 15.0),
            onPaymentResult: onGooglePayResult,
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),

          const SizedBox(height: 15)
        ],
      ),
    );
  }
}