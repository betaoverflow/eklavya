import 'package:flutter/material.dart';
import 'package:eklavya/config/fonts.dart';
import 'package:eklavya/model/mentor.dart';
import 'package:eklavya/screens/profileScreen.dart';
import 'package:eklavya/widget/ratings.dart';
import 'package:google_fonts/google_fonts.dart';

class Mentorship extends StatelessWidget {
  Mentorship({Key? key}) : super(key: key);
  List<MentorModel> list = [
    MentorModel(
        name: "Sumana Basu",
        image: "assets/sumana.png",
        type: "Google",
        price: 150,
        ratings: 4),
    MentorModel(
        name: "Aniket Pal",
        image: "assets/aniket.png",
        type: "Directi",
        price: 100,
        ratings: 5),
    MentorModel(
        name: "Sumana Basu",
        image: "assets/sumana.png",
        type: "Facebook",
        price: 170,
        ratings: 3),
    MentorModel(
        name: "Aniket Pal",
        image: "assets/aniket.png",
        type: "Walmart",
        price: 120,
        ratings: 5),
  ];

  Widget _searchBar(context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xffd2d1e1).withOpacity(.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 16),
          Icon(Icons.search),
          SizedBox(width: 12),
          SizedBox(
            width: MediaQuery.of(context).size.width - 150,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.inter(fontSize: 17),
                  border: InputBorder.none),
            ),
          ),
          Spacer(),
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.filter_list, color: Colors.white)))
        ],
      ),
    );
  }

  Widget _cards(context, MentorModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage(model: model)));
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(model.image),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade400,
                      offset: Offset(4, 4),
                    )
                  ]),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.name,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 15)),
                SizedBox(height: 5),
                Text(model.type,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        color: Colors.black54)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Ratings(ratings: model.ratings),
                SizedBox(height: 5),
                Text("\₹${model.price}/hr",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black)),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40),
                    SizedBox(height: 30),
                    Text("Find Your",
                        style: GoogleFonts.inter(
                            fontSize: 22,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300)),
                    Text("Perfect Mentor",
                        style: GoogleFonts.inter(
                            fontSize: 22,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 7),
                    _searchBar(context),
                    SizedBox(height: 25),
                    SizedBox(height: 20),
                    _cards(context, list[0]),
                    _cards(context, list[1]),
                    _cards(context, list[2]),
                    _cards(context, list[3]),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
