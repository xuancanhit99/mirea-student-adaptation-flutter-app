import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? cPrimaryColor : Colors.blue;
    return Card(
      elevation: 0,
      color: Theme.of(context).splashColor,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // const SizedBox(width: 20),
                Icon(icon, color: iconColor),
                const SizedBox(width: 20),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 16,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
