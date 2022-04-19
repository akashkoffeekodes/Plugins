import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';



class MyApp10 extends StatefulWidget {
  @override
  _MyApp10State createState() => _MyApp10State();
}

class _MyApp10State extends State<MyApp10> {
  static const platform = const MethodChannel("razorpay_flutter");

   Razorpay _razorpay;
   TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Razorpay Sample App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Enter Amount", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              TextField(
                controller: amount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Amount"
                ),
              ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: openCheckout, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
    //  'key': 'rzp_test_kugnpqevx7BjiS',
      'key': 'rzp_test_YPJu0Z0fo0lQSU',
      'amount': int.parse(amount.text ) * 100,
      'name': 'Panchratna Fashion',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8866609678', 'email': 'akashlike.v@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Your Payment Will Sucessful"
          //  + response.paymentId,
       // toastLength: Toast.LENGTH_SHORT
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Notification();
    Fluttertoast.showToast(
        msg: "Your Payment Will Be Fail"
         //   + response.code.toString()
        //    + " - " + response.message,
      //  toastLength: Toast.LENGTH_SHORT

    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: "
         //   + response.walletName,
      //  toastLength: Toast.LENGTH_SHORT
    );
  }
}

class Notification extends StatefulWidget {
  const Notification({Key key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}
