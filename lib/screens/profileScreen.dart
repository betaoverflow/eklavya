import 'package:eklavya/screens/roadmap.dart';
import 'package:flutter/material.dart';
import 'package:eklavya/config/constants.dart';
import 'package:eklavya/config/fonts.dart';
import 'package:eklavya/model/mentor.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, this.model}) : super(key: key);
  final model;

  Widget _cards(
    context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(model.image),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.shade400,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.yellow, size: 15),
                        SizedBox(height: 5),
                        Text("${model.ratings}",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300, fontSize: 10)),
                      ],
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Reviews", style: GoogleFonts.inter(fontSize: 8)),
                        SizedBox(height: 8),
                        Text("1500",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                color: Colors.black54)),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _description() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(model.name,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          height: 1.3)),
                  SizedBox(height: 5),
                  Text(model.type,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          color: Colors.black54)),
                ],
              ),
              Spacer(),
              Text("\$${model.price}/hr",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black)),
            ],
          ),
          SizedBox(height: 20),
          Text("About ${model.name.split(" ")[0]}",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, fontSize: 15, height: 1.3)),
          SizedBox(height: 5),
          Text("${Constants.description.substring(0, 350)}",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  height: 1.4,
                  color: Colors.black54)),
        ]);
  }

  Widget _achivment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Achievments",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600, fontSize: 15, height: 1.3)),
        SizedBox(height: 16),
        _achivmentCard(),
        SizedBox(height: 16),
        _achivmentCard(),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _achivmentCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(.1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
            width: 40, alignment: Alignment.center, child: Icon(Icons.people)),
        title: Text("Mentored 100+ Students",
            style:
                GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 15)),
        subtitle: Text(Constants.description.substring(0, 90),
            style:
                GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12)),
      ),
    );
  }

  Widget _button(context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Roadmap()),
        );
      },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        child: Text("Hire Now",
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
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                _cards(context),
                SizedBox(height: 20),
                _description(),
                SizedBox(height: 40),
                _achivment(),
                _button(context),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
