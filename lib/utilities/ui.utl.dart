import 'package:flutter/material.dart';

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
  final onPress;
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

class FlatBtn extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Color? color;
  final IconData? leading;
  final FontWeight? fontWeight;
  final onPress;
  const FlatBtn(
      {Key? key,
      required this.label,
      this.leading,
      this.labelColor,
      this.color,
      this.fontWeight,
      required this.onPress})
      : super(key: key);

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

class CircleCard extends StatefulWidget {
  const CircleCard({Key? key}) : super(key: key);

  @override
  State<CircleCard> createState() => _CircleCardState();
}

class _CircleCardState extends State<CircleCard> {
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
              children: const [CircleAvatar(
                backgroundImage: AssetImage('assets/img1.jpeg'),
              )],
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
                          image: DecorationImage(image: AssetImage('assets/img2.jpeg'), fit: BoxFit.cover, )
                        ),
                        // child: ClipRRect(
                        //   clipBehavior: Clip.antiAlias,
                        //   borderRadius: BorderRadius.circular(10),
                        //   child: Image(image: AssetImage('assets/img2.jpeg'), fit: BoxFit.cover,)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionBtn(
                              iconData: Icons.comment_bank_outlined,
                              onPressed: () {},
                              count: 5),
                          ActionBtn(
                              iconData: Icons.comment_bank_outlined,
                              onPressed: () {},
                              count: 5),
                          ActionBtn(
                              iconData: Icons.comment_bank_outlined,
                              onPressed: () {},
                              count: 5),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share_outlined,
                                  size: 16, color: Colors.grey))
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
          icon: Icon(widget.iconData, size: 16, color: Colors.grey),
        ),
        Text(widget.count.toString())
      ],
    );
  }
}
