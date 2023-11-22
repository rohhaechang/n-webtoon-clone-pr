import 'package:flutter/material.dart';

class DayItem extends StatefulWidget {
  const DayItem(
      {super.key,
      required this.selectedIndex,
      required this.index,
      required this.text,
      required this.onTap});

  final int selectedIndex;
  final int index;
  final String text;
  final void Function() onTap;

  @override
  State<DayItem> createState() => _DayItemState();
}

class _DayItemState extends State<DayItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 37.5,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.selectedIndex == widget.index
                      ? Colors.green
                      : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
