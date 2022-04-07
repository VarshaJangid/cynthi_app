import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';
import '/utils/razor_pay_details.dart';
import '/utils/app_route.dart';

class VarshaJangid extends StatefulWidget {
  const VarshaJangid({Key? key}) : super(key: key);

  @override
  _VarshaJangidState createState() => _VarshaJangidState();
}

class _VarshaJangidState extends State<VarshaJangid> {
  Razorpay? _razorpay;

  @override
  void initState() {
    //RazorPay
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay!.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("_handlePaymentSuccess $response");
    print("_handlePaymentSuccess ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Transaction Failed ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("EXTERNAL_WALLET ${response.walletName}");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.pink,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () => openCheckout(),
              child: const Text("Pay"),
            ),
          ),
        ),
      ),
    );
  }

  void openCheckout() async {
    try {
      var options = {
        'key': RazorPayDetails.rzpKeyTest,
        'amount': 500 * 100,
        'name': "Name",
        'description': "Cynthi'ans",
        'prefill': {'contact': '+919969696969', 'email': 'test@gmail.com'},
      };
      _razorpay!.open(options);
    } catch (e) {
      Exception("Error in Razorpay details");
    }
  }

  Future<bool> onBackPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        contentPadding:
            const EdgeInsets.only(top: 5.0, left: 20.0, bottom: 0.0),
        title: const Text("Confirm Exit",
            textAlign: TextAlign.start,
            style: TextStyle(fontFamily: 'Mada', fontWeight: FontWeight.w700)),
        content: const Text("You do not want to proceed",
            style: TextStyle(fontFamily: 'Mada')),
        actions: [
          FlatButton(
              onPressed: () => AppRoutes.dismiss(context),
              child: const Text("Cancel",
                  style: TextStyle(fontWeight: FontWeight.w600))),
          FlatButton(
              onPressed: () {},
              child: const Text("Yes",
                  style: TextStyle(
                      color: Color(0xFF0284A2), fontWeight: FontWeight.w600))),
        ],
      ),
    );
    return Future.value(true);
  }
}
