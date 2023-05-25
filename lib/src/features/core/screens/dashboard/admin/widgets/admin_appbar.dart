import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/assets_strings.dart';
import '../../../../../../localization/language_service.dart';
import '../../../../../authentication/models/admin_model.dart';
import '../../../../controllers/admin_controller.dart';
import '../../../profile_menu/admin/admin_profile_menu_page.dart';
import '../../../profile_menu/student/student_profile_menu_page.dart';



class AdminDashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminDashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final adminController = Get.put(AdminController());
    return AppBar(
      // leading: Icon(
      //   Icons.menu,
      //   color: Theme.of(context).colorScheme.onSecondaryContainer,
      // ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      title: Text(
        LanguageService.cAppNameDetailed,
        style:
            Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16),
      ),
      centerTitle: true,
      elevation: 0,
      // backgroundColor: Colors.transparent,
      actions: [
        StreamBuilder<AdminModel>(
          stream: adminController.getAdminByUidRealtime(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Error fetching admin details.'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final adminData = snapshot.data!;
            return Container(
              margin: const EdgeInsets.only(right: 10, top: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue.withOpacity(0.1)),
              child: IconButton(
                  onPressed: () {
                    // AuthenticationRepository.instance.logout();
                    Get.to(() => const AdminProfileMenuPage());
                  },
                  icon: SizedBox(
                    width: 30,
                    height: 30,
                    child: ClipOval(
                        child: SizedBox.fromSize(
                      child: adminData.img != ""
                          ? Image.network(adminData.img, fit: BoxFit.cover)
                          : Image.asset(cUserProfileImage, fit: BoxFit.cover),
                    )),
                  )),
            );
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
