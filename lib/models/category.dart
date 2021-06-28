import 'package:flutter/material.dart';

class Categories {
  String title;
  IconData icon;

  Categories(this.title, this.icon);

  //  constructor, for constructing a new User instance from a map structure
  Categories.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        icon = json['icon'] as IconData;

// method?, which converts a User instance into a map.
  Map<String, dynamic> toJson() => {
        'title': title,
        'icon': icon,
      };
}
