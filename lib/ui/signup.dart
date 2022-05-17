import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Expanded(
                  child: Text(
                    "See what's happening in the world right now.",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                ),
              ),
              Column(
                children: const [
                  FlatBtn(
                    label: 'Continue with Google',
                    labelColor: Colors.black,
                    color: Colors.transparent,
                  ),
                  FlatBtn(
                    label: 'Continue with Apple',
                    labelColor: Colors.black,
                    color: Colors.transparent,
                  ),
                  FlatBtn(
                    label: 'Continue with Google',
                    labelColor: Colors.black,
                    color: Colors.transparent,
                  ),
                ],
              )
            ],
          ),
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
  const FlatBtn(
      {Key? key,
      required this.label,
      this.leading,
      this.labelColor,
      this.color, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
