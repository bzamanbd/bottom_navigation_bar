import 'package:flutter/material.dart';

class PrimaryTopAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget title;

  PrimaryTopAppbar({Key? key,required this.title})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        letterSpacing: 1,
      ),
    );
  }
}
