import 'package:flutter/material.dart';
import 'package:animeworld/constants.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.only(left: kDefaultPadding),
      icon: Icon(Icons.menu),
      onPressed: () {},
      color: kEnabledColor,
    ),
    actions: <Widget>[
      IconButton(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        icon: Icon(Icons.search),
        onPressed: () {},
        color: kEnabledColor,
      )
    ],
  );
}
