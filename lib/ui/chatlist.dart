import 'package:flutter/material.dart';
import 'package:twit/ui/chatpage.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.chat_outlined),),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 0),
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey)
                    ]),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        BackButton(),
                        CircleAvatar(
                          radius: 18,
                          // backgroundImage: NetworkImage('src'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 150,
                      child: ListTile(
                        title: Text('Name Name'),
                        subtitle: Text('@username'),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: ListView(
                    children: const [
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                      ChatFrontCard(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChatFrontCard extends StatelessWidget {
  const ChatFrontCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ChatPage()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                CircleAvatar(
                  radius: 20,
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: const ListTile(
                title: Text("Name name"),
                subtitle: Text(
                  'This is chat,chit-chat chatty...',
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
                trailing: Text('09:02am'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
