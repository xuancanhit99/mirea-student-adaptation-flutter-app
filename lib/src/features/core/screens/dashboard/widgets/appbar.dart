import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:msa/src/features/core/screens/profile/profile_screen.dart';
import 'package:msa/src/features/core/screens/profile/student_profile_page.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';

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
            onPressed: () {
              // AuthenticationRepository.instance.logout();
              Get.to(() => const StudentProfilePage());
            },
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