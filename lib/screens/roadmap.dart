import 'package:eklavya/screens/timeline.dart';
import 'package:flutter/material.dart';

class Roadmap extends StatefulWidget {
  const Roadmap({Key? key}) : super(key: key);

  @override
  _RoadmapState createState() => _RoadmapState();
}

class _RoadmapState extends State<Roadmap> {
  final List<String> _listItem = [
    'assets/one.jfif',
    'assets/two.jfif',
    'assets/three.jfif',
    'assets/four.jfif',
    'assets/five.jfif',
    'assets/six.jfif',
    'assets/seven.jpg',
    'assets/eight.jfif',
    'assets/nine.png',
    'assets/ten.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/astronauts.png',
                        ),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Jumpstart now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _listItem
                    .map((item) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SecondRoute(item: item)),
                            );
                          },
                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(item),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }

  _onLocationTap(BuildContext context, String locationID) {
    // TODO later in this lesson, navigation!
    print('do something');
  }
}
