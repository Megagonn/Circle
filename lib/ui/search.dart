import 'package:flutter/material.dart';

class SearchCircle extends StatefulWidget {
  const SearchCircle({ Key? key }) : super(key: key);

  @override
  State<SearchCircle> createState() => _SearchCircleState();
}

class _SearchCircleState extends State<SearchCircle> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 1,
              floating: true,
              backgroundColor: Colors.white,
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(radius: 14,),
              ),
              centerTitle: true,
              title: Container(
                alignment: Alignment.center,
                height: 40,
                padding: const EdgeInsets.symmetric(vertical:7, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: .1,
                      spreadRadius: .1,
                      color: Colors.grey,
                      blurStyle: BlurStyle.outer
                    )
                  ]
                ),
                child: const TextField(
                  cursorColor: Colors.blueAccent,
                  decoration: InputDecoration(
                    hintText: "Search Circle",
                    border: InputBorder.none
                  ),
                )),
              pinned: false,
              snap: true,
              actions: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.settings_outlined, color: Colors.blueAccent))
              ],
            ),
          ],
        )
      ),
    );
  }
}