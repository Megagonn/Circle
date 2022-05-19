import 'package:flutter/material.dart';
import 'package:twit/utilities/ui.utl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return
        // const SliverSafeArea(
        //   sliver:
       Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            elevation: 1,
            floating: true,
            backgroundColor: Colors.white,
            leading: const CircleAvatar(radius: 14,),
            centerTitle: true,
            title: const Icon(
              Icons.circle_outlined,
              color: Colors.blueAccent,
            ),
            pinned: false,
            snap: true,
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.star_outlined, color: Colors.blueAccent))
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
             [
               CircleCard(),
               CircleCard(),
               CircleCard(),
               CircleCard(),
               CircleCard(),
               CircleCard(),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
               const Text('data'),
             ]
            ))
        ],
      ),
    );
    // );
  }
}
