import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twit/ui/newpost.dart';
import 'package:twit/utilities/circlepost.dart';
import 'package:twit/utilities/drawer.dart';
// import 'package:twit/utilities/ui.utl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var key = GlobalKey<ScaffoldState>();
  postStream() async {
    var posts = [];
    var getPost = await firestore.collection('posts').get();
    var postGotten = getPost.docs;
    postGotten.forEach((element) {
      posts.add(element.data());
    });
    // await
    return posts;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    postStream();
  }

  @override
  Widget build(BuildContext context) {
    Map profile = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      // appBar: AppBar(),
      key: key,
      drawer: drawer(context, profile),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Post(),
                  settings: RouteSettings(
                    arguments: profile,
                  )));
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 1,
              floating: true,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    key.currentState?.openDrawer();
                    // drawer(context, profile);
                  },
                  child: profile['photoUrl'] == '' ||
                          profile['photoUrl'] == null
                      ? const CircleAvatar(
                          child: Icon(
                            Icons.person_outline,
                            size: 34,
                            color: Colors.white,
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(profile['photoUrl']),
                          radius: 14,
                        ),
                  // profile['profileImg'] == '' || profile['profileImg'] == null
                  //   ? const Icon(
                  //     Icons.person_outline,
                  //     size: 34,
                  //     color: Colors.grey,
                  //   ): CircleAvatar(
                  //   backgroundImage: NetworkImage(profile['profileImg']),
                  //   radius: 14,
                  // ),
                ),
              ),
              centerTitle: true,
              title: const Icon(
                Icons.circle_outlined,
                color: Colors.blueAccent,
              ),
              pinned: false,
              snap: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.auto_awesome_outlined,
                        color: Colors.blueAccent))
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              // const CircleCard(post: {},),
              // const CircleCard(post: {},),
              // const CircleCard(post: {},),
              // const CircleCard(post: {},),
              // const CircleCard(post: {},),
              // const CircleCard(post: {},),
              // const CircleCard(post: {},),
              // const CircleCard(post: {},),
              // const CircleCard(post: {},),
              // const CircleCard(post: {},),
              FutureBuilder(
                future: postStream(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else {
                    if (snapshot.hasData) {
                      List post = snapshot.data;
                      // print(post);
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: LiquidPullToRefresh(
                          borderWidth: 1,
                          springAnimationDurationInMilliseconds: 600,
                          showChildOpacityTransition: false,
                          onRefresh: () {
                            setState(() {});
                            return postStream();
                          },
                          child: ListView.builder(
                            itemCount: post.length,
                            itemBuilder: (context, index) {
                              return CircleCard(
                                post: post[index],
                                prof: profile,
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: Text("No Post"));
                    }
                  }
                  // return const Center(child: Text('Something went wrong...\nStay put'));
                },
              )
            ]))
          ],
        ),
      ),
    );
    // );
  }
}
