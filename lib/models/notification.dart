class NotifyModel {
  final String content;
  final String date;
  final bool isRead;
  final String imageUrl;

  NotifyModel(
    this.content,
    this.date,
    this.isRead,
    this.imageUrl,
  );

  //  constructor, for constructing a new User instance from a map structure
  NotifyModel.fromJson(Map<String, dynamic> json)
      : content = json['content'] as String,
        date = json['date'] as String,
        isRead = json['isRead'] as bool,
        imageUrl = json['imageUrl'] as String;

  // method?, which converts a User instance into a map.
  Map<String, dynamic> toJson() => {
        'content': content,
        'date': date,
        'isRead': isRead,
        'imageUrl': imageUrl,
      };
}
