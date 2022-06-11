import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twit/firebase/post_method.dart';
import 'package:twit/model/post.dart';
import 'package:twit/utilities/ui.utl.dart';

/// [CircleCard] is the post UI model.
class CircleCard extends StatefulWidget {
  const CircleCard({
    Key? key,
    required this.post,
    required this.prof,
  }) : super(
          key: key,
        );
  final Map post;
  final Map prof;

  @override
  State<CircleCard> createState() => _CircleCardState();
}

class _CircleCardState extends State<CircleCard> {
  TextEditingController controller = TextEditingController();
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    final bool success = await PostMethods().likePost(
        widget.post['postId'], widget.post['uid'], widget.post['likes']);

    /// if failed, you can do nothing
    return success ? !isLiked : isLiked;

    // return !isLiked;
  }

  // int likeCount = 0;
  // int commentCount = 0;
  // int recirculateCount = 0;

  @override
  Widget build(BuildContext context) {
    Map post = widget.post;

    List allLikes = post['likes'];
    Map profile = widget.prof;
    // print(profile);
    bool commented = false;
    bool liked = false;
    bool recirculated = false;

    allLikes.forEach((element) {
      if (element == profile['uid']) {
        liked = true;
      }
    });

    int likeCount = post['likes'].length;
    int commentCount = post['comment'].length;
    int recirculateCount = post['repost'].length;
    // print(post['profileImg']);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      decoration: const BoxDecoration(
          border: Border.symmetric(vertical: BorderSide()),
          boxShadow: [
            BoxShadow(
                blurRadius: .1,
                spreadRadius: .1,
                blurStyle: BlurStyle.outer,
                color: Colors.grey)
          ]),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                post['profileImg'] == '' || post['profileImg'] == null
                    ? const Icon(
                        Icons.person_outline,
                        size: 34,
                        color: Colors.grey,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 0, right: 4),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(post['profileImg']),
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
                            post['firstName'] + ' ' + post['lastName'],
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            post['userName'],
                            style: TextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            timeago.format(
                                DateTime.tryParse(
                                        post['date'].toDate().toString())!
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
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: post['text'] == "" || post['text'] == null
                            ? const SizedBox.shrink()
                            : Text(
                                post['text'],
                              ),
                      ),
                      post['postUrl'] == '' || post['postUrl'] == null
                          ? const SizedBox.shrink()
                          : Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: NetworkImage(post['postUrl']),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionBtn(
                              iconData: Icons.comment_bank_outlined,
                              onPressed: () async {
                                // double height = 400;
                                comment(context, controller, profile, post);
                                // setState(() {
                                // commented = !commented;
                                // commentCount++;
                                // commented ? commentCount++ : commentCount--;
                                // });
                              },
                              count: commentCount),
                          // ActionBtn(
                          //     iconData: Icons.incomplete_circle_outlined,
                          //     onPressed: () {
                          //       setState(() {
                          //         recirculated = !recirculated;
                          //         // commentCount++;
                          //         recirculated
                          //             ? recirculateCount++
                          //             : recirculateCount--;
                          //       });
                          //     },
                          //     count: recirculateCount),
                          Row(
                            children: [
                              FavoriteButton(
                                isFavorite: liked,
                                valueChanged: (value) async {
                                  setState(() async {
                                    await PostMethods().likePost(post['postId'],
                                        profile['uid'], post['likes']);
                                    liked = !liked;
                                    // !liked ? likeCount++ : likeCount--;
                                  });
                                },
                                iconColor: Colors.redAccent.shade400,
                                iconDisabledColor: Colors.grey,
                                iconSize: 35,
                              ),
                              Text(likeCount.toString())
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Share.share(post['text']);
                              },
                              icon: const Icon(Icons.share_outlined,
                                  size: 24, color: Colors.grey))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Post reaction buttons.
class ActionBtn extends StatefulWidget {
  final IconData iconData;
  final onPressed;
  final int count;
  const ActionBtn(
      {Key? key,
      required this.iconData,
      required this.onPressed,
      required this.count})
      : super(key: key);

  @override
  State<ActionBtn> createState() => _ActionBtnState();
}

class _ActionBtnState extends State<ActionBtn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: widget.onPressed,
          icon: Icon(widget.iconData, size: 24, color: Colors.grey),
        ),
        Text(widget.count.toString())
      ],
    );
  }
}
