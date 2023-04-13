import 'package:flutter/material.dart';

import '../../../../../constants/assets_strings.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text(
        cAppName,
        style:
        Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: cCardBgColor),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(cUserProfileImage),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}