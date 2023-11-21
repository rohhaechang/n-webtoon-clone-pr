import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.opacity});

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.withOpacity(opacity),
      elevation: 0,
      leading: Icon(
        Icons.cookie,
        color: Colors.amber,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.search_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar()
      .preferredSize; // PreferredSized를 사용할 때 필수로 들어가야 하는 getter. preferredSize를 항상 정해야 한다.
}
