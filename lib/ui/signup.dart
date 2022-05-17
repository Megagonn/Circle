import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twit/ui/testing.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.circle_outlined,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "See what's happening in the world right now.",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    FlatBtn(
                      label: 'Continue with Google',
                      labelColor: Colors.black,
                      color: Colors.transparent,
                      fontWeight: FontWeight.bold,
                      onPress: () {},
                    ),
                    FlatBtn(
                      onPress: () {},
                      leading: Icons.apple_sharp,
                      label: 'Continue with Apple',
                      labelColor: Colors.black,
                      color: Colors.transparent,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Divider(
                          color: Colors.amber,
                        ),
                        Text("Or"),
                        Divider(
                          color: Colors.amber,
                        )
                      ],
                    ),
                    FlatBtn(
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Testing()));
                      },
                      label: 'Create account',
                      labelColor: Colors.white,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Text(
                          "By signing up, yuo agree to the"),
                      TextButton(onPressed: (){}, child: Text(
        "Terms of Service",
        style: const TextStyle(color: Colors.blueAccent),
      ),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
                blurRadius: .2, spreadRadius: .2, blurStyle: BlurStyle.outer)
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
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
