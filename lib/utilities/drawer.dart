import 'package:flutter/material.dart';
import 'package:twit/firebase/post_method.dart';
import 'package:twit/ui/chatlist.dart';
import 'package:twit/ui/profile.dart';

/// Home page drawer returning a [Drawer]
drawer(BuildContext context, Map map) {
  // print('object');
  return SizedBox(
    child: Drawer(
      elevation: 4,
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            currentAccountPicture: map['photoUrl'] == '' ||
                          map['photoUrl'] == null
                      ? const CircleAvatar(
                          child: Icon(
                            Icons.person_outline,
                            size: 34,
                            color: Colors.white,
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(map['photoUrl']),
                          radius: 14,
                        ),
            accountName: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  map['firstName'] + ' ' + map['lastName'],
                  style: const TextStyle(
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
            accountEmail: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '@${map['lastName']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700),
                    ),
                  ),
                  Text.rich(TextSpan(
                    text: "Followers: ${map['followers'].length}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700),
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  Text.rich(TextSpan(
                    text: "Following: ${map['followings'].length}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700),
                  )),
                ],
              ),
            ),
          ),

          // const Divider(
          //   // height: .1,
          //   thickness: .1,
          //   color: Colors.grey,
          // ),
          Column(
            children: [
              drawerLink(
                  context,
                  Icons.person_outline_outlined,
                  'Profile',
                  Profile(
                    map: map,
                  )),
              drawerLink(context, Icons.list_alt_outlined, 'Chats', ChatList(map: map)),
              drawerLink(context, Icons.topic_outlined, 'Topics', ''),
              drawerLink(
                  context, Icons.bookmark_border_outlined, 'Bookmarks', ''),
              drawerLink(
                  context, Icons.stacked_line_chart_outlined, 'Moments', ''),
              drawerLink(context, Icons.person_add_alt_outlined,
                  'Log Out', PostMethods().signOut()),
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
      popContext(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => route));
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

popContext(context) {
  Navigator.pop(context);
}
