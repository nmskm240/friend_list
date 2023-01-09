import 'package:flutter/material.dart';

class ListViewWithHeader extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Widget? trailing;

  const ListViewWithHeader({
    Key? key,
    required this.title,
    required this.children,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var header = SizedBox(
      height: 40,
      child: ListTile(
        title: Text(title),
        trailing: trailing,
      ),
    );
    return Column(
      children: [header, ...children],
    );
  }
}
