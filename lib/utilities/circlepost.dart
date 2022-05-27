import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

/// [CircleCard] is the post UI model.
class CircleCard extends StatefulWidget {
  const CircleCard({Key? key}) : super(key: key);

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

  int likeCount = 0;
  int commentCount = 0;
  int recirculateCount = 0;

  bool commented = false;
  bool recirculated = false;
  @override
  Widget build(BuildContext context) {
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
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/img1.jpeg'),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 6,
                        child: Text(
                          "Name Name",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Expanded(
                        flex: 4,
                        child: Text(
                          "@name",
                          style: TextStyle(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Expanded(flex: 1, child: Text('5h')),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.adaptive.more),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    children: [
                      const Text(
                          "Lorem ipsum dolor The [overflow] property's behavior is affected by the [softWrap] argument. If the [softWrap] is true or null, the glyph causing overflow, and those that follow, will not be rendered. Otherwise, it will be shown with the given overflow option."),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                            image: const DecorationImage(
                              image: AssetImage('assets/img2.jpeg'),
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
                                  recirculated= !recirculated;
                                  // commentCount++;
                                  recirculated ? recirculateCount++ : recirculateCount--;
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