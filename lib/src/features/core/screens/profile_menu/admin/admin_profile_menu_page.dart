import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/features/core/screens/change_password/student/student_change_passowrd.dart';
import 'package:msa/src/features/core/screens/profile/student/student_update_profile_page.dart';
import 'package:msa/src/features/core/screens/profile/widget/profile_menu.dart';

import '../../../../../localization/language_service.dart';
import '../../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../authentication/models/admin_model.dart';
import '../../../../authentication/models/student_model.dart';

import '../../../controllers/admin_controller.dart';
import '../../../controllers/student_profile_controller.dart';
import '../../change_password/admin/admin_change_passowrd.dart';
import '../../setting/admin/admin_setting_page.dart';
import '../../setting/student/student_setting_page.dart';

class AdminProfileMenuPage extends StatelessWidget {
  const AdminProfileMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminController = Get.put(AdminController());
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          LanguageService.cProfileMenu,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          Obx(
                () => IconButton(
                onPressed: () {
                  adminController.toggleDarkMode(
                      adminController.isDarkMode.value);
                },
                icon: Icon(adminController.isDarkMode.value
                    ? LineAwesomeIcons.sun
                    : LineAwesomeIcons.moon)),
          )
        ],
      ),
      body: StreamBuilder<AdminModel>(
          stream: adminController.getAdminByUidRealtime(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Error fetching student details.'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final adminData = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipOval(
                          child: SizedBox.fromSize(
                            child: adminData.img != ""
                                ? Image.network(adminData.img, fit: BoxFit.cover)
                                : Image.asset(cUserProfileImage, fit: BoxFit.cover),
                          )),
                    ),
                    const SizedBox(height: 20),
                    Text(adminData.fullName,
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 5),
                    Text.rich(TextSpan(
                        text: "${LanguageService.cEmail}: ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.outline),
                        children: [
                          TextSpan(
                            text: adminData.email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        ])),
                    const SizedBox(
                      height: 200,
                    ),
                    const Divider(),
                    // Menu
                    ProfileMenuWidget(
                      title: LanguageService.cSettings,
                      icon: Icons.settings,
                      onPress: () {
                        Get.to(() => const AdminSettingPage());
                      },
                    ),
                    ProfileMenuWidget(
                      title: LanguageService.cChangePassword,
                      icon: Icons.lock_reset,
                      onPress: () {
                        Get.to(() => const AdminChangePasswordPage());
                      },
                    ),
                    // ProfileMenuWidget(
                    //   title: "User Management",
                    //   icon: LineAwesomeIcons.user_check,
                    //   onPress: () => Get.to(() => const ListOfAllStudents()),
                    // ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ProfileMenuWidget(
                    //     title: "Information",
                    //     icon: LineAwesomeIcons.info,
                    //     onPress: () {}),
                    ProfileMenuWidget(
                        title: LanguageService.cLogout,
                        icon: LineAwesomeIcons.alternate_sign_out,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(LanguageService.cLoggingOut),
                                content: Text(LanguageService.cAreYouSure),
                                actions: [
                                  TextButton(
                                      onPressed: () => Get.back(),
                                      child: Text(LanguageService.cNo)),
                                  TextButton(
                                      onPressed: () {
                                        AuthenticationRepository.instance
                                            .logoutAuthRepo();
                                        // Get.back();
                                      },
                                      child: Text(LanguageService.cYes)),
                                ],
                              );
                            })),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
