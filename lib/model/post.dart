class Post {
  final String text;
  final String uid;
  final String postId;
  final String username;
  final String firstName;
  final String lastName;
  final String postURL;
  final String profileImage;
  final List like;
  final List comment;
  final List repost;
  final DateTime dateTime;

  Post({
    required this.firstName,
    required this.lastName,
    required this.repost,
    required this.dateTime,
    required this.text,
    required this.uid,
    required this.postId,
    required this.username,
    required this.postURL,
    required this.profileImage,
    required this.like,
    required this.comment,
  });

  toJson() {
    return {
      'text': text,
      'uid': uid,
      'postId': postId,
      'userName': username,
      'firstName': firstName,
      'lastName': lastName,
      'postUrl': postURL,
      'profileImg': profileImage,
      'likes': like,
      'comment': comment,
      'date': dateTime,
      'repost':repost
    };
  }

  factory Post.toObj(Map map) {
    return Post(
      text: map['text'],
      uid: map['uid'],
      postId: map['postId'],
      username: map['userName'],
      postURL: map['postUrl'],
      profileImage: map['profileImg'],
      like: map['likes'],
      comment: map['comment'],
      dateTime: map['date'],
      repost: map['repost'], firstName: map['firstName'], lastName: map['lastName'],
    );
  }
}
