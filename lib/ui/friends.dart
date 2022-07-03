import 'package:flutter/material.dart';
import 'package:twit/ui/chatpage.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  PageController controller = PageController();
  bool isFollower = true;
  int currentIndex = 0;
  List<Widget> listOfFriends = [
    ListView(
      children: [
        FriendCard(profile: {'profile': 'profile'}),
      ],
    ),
    ListView(
      children: [
        FriendCard(profile: {'profile': 'profile'}),
        FriendCard(profile: {'profile': 'profile'}),
        FriendCard(profile: {'profile': 'profile'}),
      ],
    ),
    // FriendCard(profile: {'profile': 'profile'}),
    // FriendCard(profile: {'profile': 'profile'}),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border: isFollower
                              ? const Border(
                                  bottom: BorderSide(
                                    width: 2,
                                    color: Colors.lightBlue,
                                  ),
                                )
                              : const Border(),
                        ),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                isFollower = true;
                                currentIndex = 0;
                              });
                              controller.animateToPage(currentIndex,
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.easeInOut);
                            },
                            child: const Text('Follower'))),
                    Container(
                        decoration: BoxDecoration(
                          border: !isFollower
                              ? const Border(
                                  bottom: BorderSide(
                                    width: 2,
                                    color: Colors.lightBlue,
                                  ),
                                )
                              : const Border(),
                        ),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                isFollower = false;
                                currentIndex = 1;
                              });
                              controller.animateToPage(currentIndex,
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.easeInOut);
                            },
                            child: const Text('Following'))),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: PageView.builder(
                  controller: controller,
                  physics: const ScrollPhysics(),
                  // children: listOfFriends,
                  itemBuilder: (context, index) {
                    return listOfFriends[index];
                  },
                  itemCount: listOfFriends.length,
                  onPageChanged: (index) {
                    setState(() {
                      isFollower = !isFollower;
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class FriendCard extends StatelessWidget {
  const FriendCard({Key? key, required this.profile}) : super(key: key);
  final Map profile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => const ChatPage()));
      // },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        decoration: const BoxDecoration(
            // border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                CircleAvatar(
                  radius: 20,
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: ListTile(
                title: const Text("Name name"),
                // subtitle: Text(
                //   'This is chat,chit-chat chatty...',
                //   style: TextStyle(overflow: TextOverflow.ellipsis),
                // ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatPage()));
                    },
                    icon: Icon(Icons.message_outlined)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
