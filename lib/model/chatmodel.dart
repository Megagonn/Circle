class ChatModel {
  final String text;
  final String uid;
  final DateTime time;

  ChatModel({required this.text, required this.time, required this.uid});

  factory ChatModel.toClass(Map map) {
    return ChatModel(text: map['text'], uid: map['uid'], time: map['time']);
  }
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'uid': uid,
      'time': time,
    };
  }
}
