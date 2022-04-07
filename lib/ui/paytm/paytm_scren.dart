import 'dart:convert';
import '/utils/app_route.dart';
import '/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paytm/paytm.dart';

import '../../utils/app_methods.dart';

class PaytmScreen extends StatefulWidget {
  String amount;
  String customerId;
  String lectureId;
  String studentId;

  PaytmScreen({
    Key? key,
    required this.amount,
    required this.customerId,
    required this.lectureId,
    required this.studentId,
  }) : super(key: key);

  @override
  _PaytmState createState() => _PaytmState();
}

class _PaytmState extends State<PaytmScreen> {
  String payment_response = '';

  //Live
  // String mid = "kZmAZl49163828518919";
  // String PAYTM_MERCHANT_KEY = "Cof4tMeKiz%1Flmn";
  // String website = "WEBSTAGING";
  // bool testing = false;

  // Testing
  String mid = "kZmAZl49163828518919";
  String PAYTM_MERCHANT_KEY = "Cof4tMeKiz%1Flmn";
  String website = "WEBSTAGING";
  bool testing = true;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const AppColor.getColor().creamColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => AppRoutes.dismiss(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: const AppColor.getColor().black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                // payment_response != null
                //     ? Text('Response: $payment_response\n')
                //     : Container(),
                ElevatedButton(
                  onPressed: () {
                    //Firstly Generate CheckSum bcoz Paytm Require this
                    generateTxnToken(0);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const AppColor.getColor().theme),
                  child: const Text(
                    "Pay using Wallet",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //Firstly Generate CheckSum bcoz Paytm Require this
                    generateTxnToken(1);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const AppColor.getColor().theme),
                  child: const Text(
                    "Pay using Net Banking",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //Firstly Generate CheckSum bcoz Paytm Require this
                    generateTxnToken(2);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const AppColor.getColor().theme),
                  child: const Text(
                    "Pay using UPI",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const AppColor.getColor().theme),
                  onPressed: () {
                    //Firstly Generate CheckSum bcoz Paytm Require this
                    generateTxnToken(3);
                  },
                  child: const Text(
                    "Pay using Credit Card",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void generateTxnToken(int mode) async {
    setState(() {
      loading = true;
    });
    String orderId = DateTime.now().millisecondsSinceEpoch.toString();

    String callBackUrl = (testing
            ? 'https://securegw-stage.paytm.in'
            : 'https://securegw.paytm.in') +
        '/theia/paytmCallback?ORDER_ID=' +
        orderId;

    //Host the Server Side Code on your Server and use your URL here. The following URL may or may not work. Because hosted on free server.
    //Server Side code url: https://github.com/mrdishant/Paytm-Plugin-Server

    var url = 'https://desolate-anchorage-29312.herokuapp.com/generateTxnToken';

    var body = json.encode({
      "mid": mid,
      "key_secret": PAYTM_MERCHANT_KEY,
      "website": website,
      "orderId": orderId,
      "amount": widget.amount.toString(),
      "callbackUrl": callBackUrl,
      "custId": widget.customerId,
      "mode": mode.toString(),
      "testing": testing ? 0 : 1
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Content-type': "application/json"},
      );

      print("Response is");
      print(response.body);
      String txnToken = response.body;
      setState(() {
        payment_response = txnToken;
      });

      var paytmResponse = Paytm.payWithPaytm(
          mId: mid,
          orderId: orderId,
          txnToken: txnToken,
          txnAmount: widget.amount.toString(),
          callBackUrl: callBackUrl,
          staging: testing,
          appInvokeEnabled: false);

      paytmResponse.then((value) {
        print(value);
        setState(() {
          loading = false;
          print("Value is ");
          print(value);
          print('Value -------- ${value['response']['STATUS']}');
          print('payment_response -------- $payment_response');
          if (value['error']) {
            payment_response = value['errorMessage'];
          } else {
            if (value['response'] != null) {
              payment_response = value['response']['STATUS'];
            }
          }
          payment_response += "\n" + value.toString();
          if (value['response']['STATUS'] == "TXN_SUCCESS") {
            bookNow(value);
          }
        });
      });
    } catch (e) {
      print(e);
    }
  }

  bookNow(Map value) async {
    Map<String, String> params = {
      'lacture_id': widget.lectureId,
      'transaction_id': value['response']['TXNID']!,
      'amount': value['response']['TXNAMOUNT'],
      'status': "1",
      'student_id': widget.studentId,
    };
    print("Params ---- $params");
    try {
      final response = await http.post(
          Uri.parse("https://codevweb.com/demo/api/booklacture"),
          body: params);
      if (response.statusCode == 200) {
        String valur = '';
        setState(() {
          valur = jsonDecode(response.body);
        });
        if (valur == "Your Lacture Have been successfully Booked") {
          print("Booked --- $valur");
        } else {
          flutterToast(valur, Colors.redAccent);
        }
      }
    } catch (e) {
      flutterToast("Something went wrong !!!", Colors.redAccent);
      Exception("Exception in Login API $e");
    }
  }
}
