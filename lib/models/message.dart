import 'package:bazar/models/user.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or server Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;
  final bool isOnline;

  Message(
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
    this.isOnline,
  );

  //  constructor, for constructing a new User instance from a map structure
  Message.fromJson(Map<String, dynamic> json)
      : sender = json['sender'] as User,
        time = json['time'] as String,
        text = json['text'] as String,
        isLiked = json['isLiked'] as bool,
        unread = json['unread'] as bool,
        isOnline = json['isOnline'] as bool;

  // method?, which converts a User instance into a map.
  Map<String, dynamic> toJson() => {
        'sender': sender,
        'time': time,
        'text': text,
        'isLiked': isLiked,
        'unread': unread,
        'isOnline': isOnline,
      };
}
