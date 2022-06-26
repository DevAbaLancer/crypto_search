import 'package:flutter/material.dart';

abstract class Styles {
  static const titleColor = Colors.white;

  static const TextStyle appBarTitleTS = TextStyle(
    color: Styles.titleColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );
  static const TextStyle searchTitleTS = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle listCardTitleTS = TextStyle(
    color: Colors.yellow.shade500,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );
}
