import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:twit/firebase/post_method.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  var height = false;

  _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 35,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
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
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    height: !height
                        ? MediaQuery.of(context).size.height - 175
                        : MediaQuery.of(context).size.height - 425,
                    child: ListView(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            // padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: const ListTile(
                              title: Text(
                                'Blah blah blah Blah blah blah Blah blah blah',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Align(
                                child: Text('09:22pm'),
                                alignment: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            // padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: const ListTile(
                              title: Text(
                                'Blah blah blah',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Align(
                                child: Text('09:22pm'),
                                alignment: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            // padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: const ListTile(
                              title: Text(
                                'Blah blah blah Blah blah blah Blah blah blah',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Align(
                                child: Text('09:22pm'),
                                alignment: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            // padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: const ListTile(
                              title: Text(
                                'Blah blah blah',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Align(
                                child: Text('09:22pm'),
                                alignment: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            // padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: const ListTile(
                              title: Text(
                                'Blah blah blah Blah blah blah Blah blah blah',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Align(
                                child: Text('09:22pm'),
                                alignment: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            // padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: const ListTile(
                              title: Text(
                                'Blah blah blah',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Align(
                                child: Text('09:22pm'),
                                alignment: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.all(3),
                            width: 2 * MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              'Blah blah blah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //               Container(
                //                 height: 80,
                //                 width: MediaQuery.of(context).size.width,
                //                 padding: const EdgeInsets.all(5),
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10),
                //                   color: Color.fromARGB(221, 252, 252, 252),

                //                 ),
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Expanded(
                //                       flex:1,
                //                       child: CircleAvatar(radius: 15,
                //                       child: EmojiPicker(
                //     onEmojiSelected: (category, emoji) {
                //         // Do something when emoji is tapped
                //     },
                //     onBackspacePressed: () {
                //         // Backspace-Button tapped logic
                //         // Remove this line to also remove the button in the UI
                //     },
                //     config: Config(
                //         columns: 7,
                //         emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                //         verticalSpacing: 0,
                //         horizontalSpacing: 0,
                //         gridPadding: EdgeInsets.zero,
                //         initCategory: Category.RECENT,
                //         bgColor: Color(0xFFF2F2F2),
                //         indicatorColor: Colors.blue,
                //         iconColor: Colors.grey,
                //         iconColorSelected: Colors.blue,
                //         progressIndicatorColor: Colors.blue,
                //         backspaceColor: Colors.blue,
                //         skinToneDialogBgColor: Colors.white,
                //         skinToneIndicatorColor: Colors.grey,
                //         enableSkinTones: true,
                //         showRecentsTab: true,
                //         recentsLimit: 28,
                //         noRecents: const Text(
                //           'No Recents',
                //           style: TextStyle(fontSize: 20, color: Colors.black26),
                //           textAlign: TextAlign.center,
                //         ),
                //         tabIndicatorAnimDuration: kTabScrollDuration,
                //         categoryIcons: const CategoryIcons(),
                //         buttonMode: ButtonMode.MATERIAL,
                //     ),
                // )),
                //                     ),
                //                     Expanded(
                //                       flex: 7,
                //                       child: TextField(
                //                         decoration: InputDecoration(
                //                           border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(50), gapPadding: 10),
                //                           fillColor: Color.fromARGB(221, 252, 252, 252),

                //                         ),
                //                       ),
                //                     ),
                //                     Expanded(
                //                       flex:1,
                //                       child:Icon(Icons.send),)
                //                   ],
                //                 ),
                //               ),
                Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            emojiShowing = !emojiShowing;
                            height = !height;
                          });
                        },
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                            controller: _controller,
                            // expands: true,
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.black87),
                            decoration: InputDecoration(
                              hintText: 'Type a message',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0,
                                  bottom: 8.0,
                                  top: 8.0,
                                  right: 16.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            )),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                          onPressed: () async {
                            await PostMethods()
                                .sendMessage('uid', _controller.text.trim());
                            _controller.clear();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          )),
                    )
                  ],
                ),
                Offstage(
                  offstage: !emojiShowing,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 240,
                      child: EmojiPicker(
                          onEmojiSelected: (Category category, Emoji emoji) {
                            _onEmojiSelected(emoji);
                          },
                          onBackspacePressed: _onBackspacePressed,
                          config: Config(
                              columns: 7,
                              // Issue: https://github.com/flutter/flutter/issues/28894
                              emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                              verticalSpacing: 0,
                              horizontalSpacing: 0,
                              gridPadding: EdgeInsets.zero,
                              initCategory: Category.RECENT,
                              bgColor: const Color(0xFFF2F2F2),
                              indicatorColor: Colors.blue,
                              iconColor: Colors.grey,
                              iconColorSelected: Colors.blue,
                              progressIndicatorColor: Colors.blue,
                              backspaceColor: Colors.blue,
                              skinToneDialogBgColor: Colors.white,
                              skinToneIndicatorColor: Colors.grey,
                              enableSkinTones: true,
                              showRecentsTab: true,
                              recentsLimit: 28,
                              replaceEmojiOnLimitExceed: false,
                              noRecents: const Text(
                                'No Recents',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black26),
                                textAlign: TextAlign.center,
                              ),
                              tabIndicatorAnimDuration: kTabScrollDuration,
                              categoryIcons: const CategoryIcons(),
                              buttonMode: ButtonMode.MATERIAL)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
