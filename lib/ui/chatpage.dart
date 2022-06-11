import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({ Key? key }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                decoration:  const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                  boxShadow: [
                    BoxShadow(offset: Offset(1, 0), blurStyle: BlurStyle.outer, color: Colors.grey)
                  ]
                ),
                child: Row(
                  children:  [
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
                    children:  [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          margin: const EdgeInsets.all(3),
                          width: 2* MediaQuery.of(context).size.width/3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade500,
                          ),
                          child: Text('Blah blah blah Blah blah blah Blah blah blah', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          margin: const EdgeInsets.all(3),
                          width: 2* MediaQuery.of(context).size.width/3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade500,
                          ),
                          child: Text('Blah blah blah'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreenAccent,
                          ),
                          child: Text('Blah blah blah'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreenAccent,
                          ),
                          child: Text('Blah blah blah'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreenAccent,
                          ),
                          child: Text('Blah blah blah'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreenAccent,
                          ),
                          child: Text('Blah blah blah'),
                        ),
                      ),
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