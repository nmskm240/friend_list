import 'package:flutter/material.dart';

class ListViewWithHeader extends StatelessWidget {
  final Widget? title;
  final List<Widget> children;
  final Widget? leading;
  final Widget? action;
  final bool scrollLock;

  const ListViewWithHeader({
    super.key,
    this.title,
    required this.children,
    this.leading,
    this.action,
    this.scrollLock = false,
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
        ListView(
          shrinkWrap: scrollLock,
          physics: scrollLock ? const NeverScrollableScrollPhysics() : null,
          children: children,
        ),
      ],
    );
  }
}
