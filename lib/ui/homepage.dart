import 'package:flutter/material.dart';
import 'package:twit/ui/newpost.dart';
import 'package:twit/utilities/circlepost.dart';
import 'package:twit/utilities/drawer.dart';
import 'package:twit/utilities/ui.utl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(context),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Post()));
          },
          child: const Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 1,
              floating: true,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/img2.jpeg'),
                    radius: 14,
                  ),
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
              const CircleCard(),
              const CircleCard(),
              const CircleCard(),
              const CircleCard(),
              const CircleCard(),
              const CircleCard(),
              const CircleCard(),
              const CircleCard(),
              const CircleCard(),
              const CircleCard(),
            ]))
          ],
        ),
      ),
    );
    // );
  }
}
