import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:eklavya/screens/mentorship.dart';
import 'package:eklavya/screens/opportunities.dart';
import 'package:eklavya/screens/roadmap.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[Roadmap(), Opportunities(), Mentorship()][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.1,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(
                Icons.alt_route,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.alt_route,
                color: Colors.black,
              ),
              title: Text("Roadmap")),
          BubbleBottomBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(
                Icons.lightbulb,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.lightbulb,
                color: Colors.black,
              ),
              title: Text("Opportunities")),
          BubbleBottomBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(
                Icons.people,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.people,
                color: Colors.black,
              ),
              title: Text("Mentorship")),
        ],
      ),
    );
  }
}
