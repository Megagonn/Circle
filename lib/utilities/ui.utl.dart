// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twit/firebase/post_method.dart';
import 'package:twit/ui/profile.dart';
import 'package:twit/utilities/circlepost.dart';

import 'package:timeago/timeago.dart' as timeago;

textBtn({required String text, required onPress}) {
  InkWell(
    onTap: onPress,
    child: Container(
      child: Text(
        text,
        style: const TextStyle(color: Colors.blueAccent),
      ),
    ),
  );
  return text;
}

class TextBtn extends StatelessWidget {
  final String text;
  final dynamic onPress;
  const TextBtn({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        child: Text(
          text,
          style: const TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}

/// [FlatBtn] is a reusable button widget that can take in
/// [IconData] and string [label]
class FlatBtn extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Color? color;
  final IconData? leading;
  final FontWeight? fontWeight;
  final dynamic onPress;
  const FlatBtn({
    Key? key,
    required this.label,
    this.leading,
    this.labelColor,
    this.color,
    this.fontWeight,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(
            colors: [Colors.white, color!, color!, Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
                blurRadius: .2, spreadRadius: .2, blurStyle: BlurStyle.outer)
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          leading == null
              ? const SizedBox.shrink()
              : Icon(
                  leading,
                  color: labelColor,
                ),
          Text(
            label,
            style: TextStyle(color: labelColor, fontWeight: fontWeight),
          ),
        ]),
      ),
    );
  }
}

comment(context, controller, profile, post) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 10,
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(12),
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width / 2,
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black),
                ),
              ),
              const Text(
                'Comment:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const Divider(),
              TextField(
                controller: controller,
                maxLength: 500,
                maxLines: 3,
                decoration: const InputDecoration(
                    hintText: 'Comment...', border: InputBorder.none),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        // var allposts = await FirebaseFirestore.instance
                        //     .collection('posts')
                        //     .get();
                        // var currentPost = allposts.docs
                        //     .where((element) => element.id == post['postId'])
                        //     .first;
                        // var comments = currentPost.data()['comment'];

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => CommentPage(
                        //           post: post,
                        //           profile: profile,
                        //           comments: comments),
                        //       settings: RouteSettings(
                        //           arguments: {post, profile, comments})
                        //     ));
                        allComments(context, post, profile);
                        // Navigator.pop(context);
                      },
                      child: const Text('All comment'),
                    ),
                  ),
                  Expanded(
                    child: FlatBtn(
                        label: 'Comment',
                        labelColor: Colors.white,
                        color: Colors.blue,
                        onPress: () async {
                          if (controller.text.trim() != '') {
                            Navigator.pop(context);
                            await PostMethods().postComment(
                              post['postId'],
                              controller.text.trim(),
                              profile['uid'],
                              "${profile['firstName']} ${profile['lastName']}",
                              "${profile['username']}",
                              "${profile['profileImage']}",
                            );
                          }
                        }),
                  ),
                ],
              )
            ],
          ),
        );
      });
}

allComments(context, post, profile) async {
  // print('getComments');
  var allposts = await FirebaseFirestore.instance.collection('posts').get();
  var currentPost =
      allposts.docs.where((element) => element.id == post['postId']).first;
  // print(currentPost);
  var comments = currentPost.data()['comment'];
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 10,
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height - 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width / 2,
                  margin: const EdgeInsets.only(bottom: 14, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Comment:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              CircleCard(post: post, prof: profile),
              const SizedBox(
                height: 4,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: ((context, index) {
                      print(comments[0]);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: CommentCard(comment: comments[index]),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

// class CommentPage extends StatefulWidget {
//   const CommentPage(
//       {Key? key,
//       required this.post,
//       required this.profile,
//       required this.comments})
//       : super(key: key);
//   final Map post;
//   final Map profile;
//   final List comments;

//   @override
//   State<CommentPage> createState() => _CommentPageState();
// }

// class _CommentPageState extends State<CommentPage> {
//   @override
//   void initState() {
//     super.initState();
//     print(widget.comments);
//     print(widget.profile);
//     print(widget.post);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // dynamic map = ModalRoute.of(context)!.settings.arguments;
//     // print(map);
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//           child: ListView(
//         children: [
//           CircleCard(post: widget.post, prof: widget.profile),
//           CommentCard(comment: widget.comments[0]),
//         ],
//       )),
//     );
//   }
// }

class CommentCard extends StatelessWidget {
  const CommentCard({Key? key, required this.comment}) : super(key: key);
  final Map comment;
  // final Map profile;

  @override
  Widget build(BuildContext context) {
    print('i d=got here');
    print(comment['profilePic']);
    print(comment);
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (comment['profilePic'] == '' || comment['profilePic'] == null)
                      ? const Icon(
                          Icons.person_outline,
                          size: 34,
                          color: Colors.grey,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 0, right: 4),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(comment['profilePic']),
                          ),
                        ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              comment['name'],
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              comment['userName'],
                              style: TextStyle(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              timeago.format(
                                  DateTime.tryParse(comment['datePublished']
                                          .toDate()
                                          .toString())!
                                      .subtract(
                                    const Duration(minutes: 1),
                                  ),
                                  locale: 'en_short'),
                            ),
                          ),
                          // Expanded(
                          //   flex: 1,
                          //   child: IconButton(
                          //     onPressed: () {},
                          //     icon: Icon(Icons.adaptive.more),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      comment['text'],
                    ),
                  ),
                ],
              ),
            ]));
  }
}
