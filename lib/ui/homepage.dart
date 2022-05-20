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
       SafeArea(
         child: Scaffold(
             backgroundColor: Colors.white,
             floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add),),
             bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.home_outlined, color: Colors.blueAccent,)), label: '',
          // backgroundColor: Colors.amberAccent,
          ),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined, color: Colors.blueAccent,)), label: 'Home', ),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined, color: Colors.blueAccent,)), label: 'Home'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.mail_outline_outlined, color: Colors.blueAccent,)), label: 'Home'),
             ],
             elevation: 8,
             ),
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
                 
               ]
              ))
          ],
             ),
           ),
       );
    // );
  }
}
