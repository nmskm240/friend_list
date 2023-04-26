import 'package:flutter/material.dart';

class ListViewWithHeader extends StatelessWidget {
  final Widget? title;
  final Widget body;
  final Widget? leading;
  final Widget? action;

  const ListViewWithHeader({
    super.key,
    this.title,
    required this.body,
    this.leading,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        leading ?? const Spacer(),
        title ?? const Spacer(),
        action ?? const Spacer(),
      ],
    );
    return Column(
      children: <Widget>[
        header,
        body,
      ],
    );
  }
}
