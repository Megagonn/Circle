// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:twit/ui/homepage.dart';
import 'package:twit/ui/search.dart';

class PageViews extends StatefulWidget {
  const PageViews({Key? key}) : super(key: key);

  @override
  State<PageViews> createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {
  PageController controller = PageController();
  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: ''
            // title: const Text('Home'),
            // inactiveColor: Colors.grey.shade400,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: ''
            // title: const Text('Search'),
            // inactiveColor: Colors.grey.shade400,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: ''
            // title: const Text('Notification'),
            // inactiveColor: Colors.grey.shade400,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: ''
            // title: const Text('Message'),
            // inactiveColor: Colors.grey.shade400,
          ),
        ],
        onTap: (index) {
          setState(() {
            cIndex = index;
          });
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            cIndex = index;
          });
        },
        pageSnapping: true,
        physics: const ScrollPhysics(),
        children: const [
          Home(),
          SearchCircle(),
          Home(),
          SearchCircle(),
          
        ],
      ),
    );
  }
}
