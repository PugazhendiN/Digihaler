import 'package:flutter/material.dart';

class InputWithIcon extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final double radius;
  final Color color;
  const InputWithIcon(
      {required this.hintText,
      required this.icon,
      required this.radius,
      required this.color})
      : super();

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.color == null ? Colors.white : widget.color,
              width: 0.5),
          borderRadius: widget.radius == null
              ? BorderRadius.circular(50)
              : BorderRadius.circular(widget.radius)),
      child: Row(
        children: [
          Container(
            child: Icon(
              widget.icon == null ? Icons.email : widget.icon,
              size: 20,
              color: widget.color == null ? Colors.white : widget.color,
            ),
            width: 60,
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: widget.color == null ? Colors.white : widget.color),
                border: InputBorder.none),
          ))
        ],
      ),
    );
  }
}
