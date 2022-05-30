import 'package:flutter/material.dart';
import 'package:twit/ui/profile.dart';

/// Home page drawer returning a [Drawer]
drawer(BuildContext context) {
  // print('object');
  return SizedBox(
    child: Drawer(
      elevation: 4,
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/img2.jpeg'),
            ),
            accountName: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Name Name',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 20),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            accountEmail: const Text(
              '@name',
              style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
            ),
          ),

          // const Divider(
          //   // height: .1,
          //   thickness: .1,
          //   color: Colors.grey,
          // ),
          Column(
            children: [
              drawerLink(context, Icons.person_outline_outlined, 'Profile', const Profile()),
              drawerLink(context, Icons.list_alt_outlined, 'Lists', ''),
              drawerLink(context, Icons.topic_outlined, 'Topics', ''),
              drawerLink(context, Icons.bookmark_border_outlined, 'Bookmarks', ''),
              drawerLink(context, Icons.stacked_line_chart_outlined, 'Moments', ''),
              drawerLink(
                  context, Icons.person_add_alt_outlined, 'Follower request', ''),
            ],
          ),
          const Divider(
            // height: .1,
            thickness: .1,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

drawerLink(BuildContext context, IconData iconData, String label, route) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> route));
    },
    child: Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(iconData),
          const SizedBox(
            width: 8,
          ),
          Text(label),
        ],
      ),
    ),
  );
}
