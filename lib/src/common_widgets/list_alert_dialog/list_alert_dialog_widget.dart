import 'package:flutter/material.dart';

class ListAlertDialog extends StatelessWidget {
  final String title;
  final List<String> items;
  final void Function(int) onItemSelected;

  const ListAlertDialog(
      {super.key,
      required this.title,
      required this.items,
      required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            items.length,
            (index) => ListTile(
              title: Text(items[index]),
              onTap: () {
                onItemSelected(index);
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
