import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:timeago/timeago.dart' as timeago;

/// [CircleCard] is the post UI model.
class CircleCard extends StatefulWidget {
  const CircleCard({Key? key, required this.post}) : super(key: key);
  final Map post;

  @override
  State<CircleCard> createState() => _CircleCardState();
}

class _CircleCardState extends State<CircleCard> {
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  // int likeCount = 0;
  // int commentCount = 0;
  // int recirculateCount = 0;

  bool commented = false;
  bool recirculated = false;
  @override
  Widget build(BuildContext context) {
    Map post = widget.post;
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
                    ): Padding(
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
                              ), locale: 'en_short'
                            ),
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
                        child: post['text'] == "" || post['text'] == null ? const SizedBox.shrink() : Text(
                          post['text'],
                        ),
                      ),
                      post['postUrl'] == '' || post['postUrl'] == null
                          ? const SizedBox.shrink() : Container(
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
                              onPressed: () {
                                setState(() {
                                  commented = !commented;
                                  // commentCount++;
                                  commented ? commentCount++ : commentCount--;
                                });
                              },
                              count: commentCount),
                          ActionBtn(
                              iconData: Icons.incomplete_circle_outlined,
                              onPressed: () {
                                setState(() {
                                  recirculated = !recirculated;
                                  // commentCount++;
                                  recirculated
                                      ? recirculateCount++
                                      : recirculateCount--;
                                });
                              },
                              count: recirculateCount),
                          LikeButton(
                              size: 24,
                              countPostion: CountPostion.right,
                              likeCount: 0,
                              onTap: onLikeButtonTapped),
                          IconButton(
                              onPressed: () {},
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
