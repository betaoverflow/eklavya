import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eklavya/screens/chatRoom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Pricing extends StatefulWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  _PricingState createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  int _selectedIndex = 0;

  final items = [
    {"title": "Silver", "price": "150"},
    {"title": "Gold", "price": "300"},
    {"title": "Platinum", "price": "500"},
  ];

  late Razorpay _razorpay;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    initializeRazorPay();
  }

  void initializeRazorPay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void launchRazorPay() async {
    int amountToPay = int.parse(items[_selectedIndex]["price"]!) * 100;

    final name = await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((snapshot) => snapshot.data()!["name"]);
    print(name);

    var options = {
      'key': 'rzp_test_ebW9jXPs7U6lyc',
      'amount': "$amountToPay",
      'currency': "INR",
      'name': "$name",
      'description': "Eklavya Premium",
      'prefill': {'contact': "9024335853", 'email': "aabhassao0@gmail.com"}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print("Payment Successful");

    print(
        "${response.orderId} \n${response.paymentId} \n${response.signature}");
    if (response.paymentId != null) {
      final tier = items[_selectedIndex]["title"];
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({"plan": "$tier"});

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatRoomScreen()));
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Failed");

    print("${response.code}\n${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("Payment Failed");
  }

  Widget _button(context) {
    double width = MediaQuery.of(context).size.width;

    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {
        launchRazorPay();
      },
      child: Container(
        height: 40,
        width: width * 0.7,
        alignment: Alignment.center,
        child: Text("select plan & proceed",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(height: 128),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final title = item["title"];
                  final price = item["price"];

                  return ListTile(
                    title: Center(child: Text('$title Plan')),
                    subtitle: Center(child: Text('₹$price')),
                    selected: index == _selectedIndex,
                    selectedTileColor: Colors.black,
                    contentPadding: EdgeInsets.all(8),
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );
                }),
          ),
          SizedBox(height: 48),
          _button(context),
          SizedBox(height: 48),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
