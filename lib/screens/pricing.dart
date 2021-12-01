import 'package:eklavya/screens/auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pricing extends StatefulWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  _PricingState createState() => _PricingState();
}

class _PricingState extends State<Pricing> {

  int _selectedIndex = 0;

  final items = [
    {
      "title": "Silver",
      "price": "150"
    },
    {
      "title": "Gold",
      "price": "300"
    },
    {
      "title": "Platinum",
      "price": "500"
    },
  ];


  Widget _button(context) {
    double width = MediaQuery.of(context).size.width;

    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
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
                }
            ),
          ),
          SizedBox(height: 48),
          _button(context),
          SizedBox(height: 48),
        ],
      ),
    ));
  }
}
