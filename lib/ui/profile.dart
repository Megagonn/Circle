import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twit/utilities/circlepost.dart';
import 'package:twit/utilities/ui.utl.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.map}) : super(key: key);
  final Map map;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController controller = ScrollController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // late TabController tabcontroller;
  Future future() async {
    var response =
        await firestore.collection('users').doc(widget.map['uid']).get();
    print(response.data()!['posts']);
    return response.data()!['posts'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future();
    // tabcontroller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var profile = widget.map;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: controller,
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, index) {
            return [
              SliverAppBar(
                  backgroundColor: Colors.black45,
                  leading: BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    PopupMenuButton(
                      icon: Icon(Icons.adaptive.more_outlined),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Share'),
                            ),
                          ),
                        ];
                      },
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/img2.jpeg'),
                        ),
                      ),
                    ),
                    title: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 70,
                          left: -20,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/img1.jpeg')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  stretch: true,
                  expandedHeight: 150,
                  pinned: true,
                  primary: true),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            profile['firstName'] + ' ' + profile['lastName'],

                            ///name of user
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const Spacer(),
                          Flexible(
                              child: FlatBtn(
                            label: 'Edit profile',
                            onPress: () {},
                            labelColor: Colors.grey,
                            color: Colors.white,
                          )),
                        ],
                      ),
                    ),
                    Text(profile['username']),

                    /// nick of user
                    Text(
                      profile['bio'],
                      softWrap: true,
                    ), // Bio
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                        ),
                        Text.rich(
                          TextSpan(
                              text: 'Nigeria ',
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                              children: [
                                TextSpan(
                                  text: ' github.com/megagonn',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.auto_awesome),
                        Text('August 7, 1997'),
                      ],
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Following: ${profile['following'] ?? 0}',
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Follower: ${profile['follower'] ?? 0}',
                          ),
                        ),
                      ],
                    ),
                    const DefaultTabController(
                      length: 1,
                      child: TabBar(
                          padding:
                              EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                          labelColor: Colors.blueAccent,
                          // indicatorPadding: EdgeInsets.all(8),

                          isScrollable: true,
                          tabs: [
                            Text('Posts'),
                          ]),
                    )
                  ],
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: SizedBox(
              height: double.maxFinite,
              child: DefaultTabController(
                length: 1,
                child: TabBarView(
                    // controller: controller,
                    children: [
                      // CircleCard(),
                      FutureBuilder(
                          future: future(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator.adaptive();
                            } else {
                              List data = snapshot.data;
                             return ListView.builder(
                               physics: const ScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                return const CircleCard();
                              });
                            }
                            // return const SizedBox.shrink();
                          })
                      // CircleCard()
                      // Text('data'),
                      // Text('data'),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
