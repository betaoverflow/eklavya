import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final logoUrl, job, company, time;

  const JobCard(
      {Key? key,
      this.logoUrl = "assets/uberLogo.jpg",
      this.job = "Software Developer Intern",
      this.time = "19th November",
      this.company = "Uber"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 203,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xff707070),
                width: 1,
              ),
              image:
                  DecorationImage(image: AssetImage(logoUrl), fit: BoxFit.fill),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.black.withOpacity(0.33),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      company,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(time, style: TextStyle(fontSize: 13, color: Color(0xff8a8989))),
          SizedBox(
            height: 7,
          ),
          Text(job,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
