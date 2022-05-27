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