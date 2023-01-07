import 'package:flutter/material.dart';

class Category  {
  final Color color;
  final String? title;
  final String? id;

  const Category({this.color = Colors.orange, @required this.title, @required this.id});
}