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

  factory ListViewWithHeader.builder({
    Key? key,
    required BuildContext context,
    required String title,
    required int itemCount,
    required Function(BuildContext context, int index) itemBuilder,
    Widget? trailing,
  }) {
    final List<Widget> children = [];
    for (var i = 0; i < itemCount; i++) {
      children.add(itemBuilder(context, i));
    }
    return ListViewWithHeader(
      title: title,
      trailing: trailing,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    var header = SizedBox(
      height: 40,
      child: ListTile(
        title: Text(title),
        trailing: trailing,
      ),
    );
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [header, ...children],
    );
  }
}
