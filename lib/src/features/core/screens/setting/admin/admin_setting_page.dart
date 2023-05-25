import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/features/core/screens/dashboard/student/student_dashboard.dart';

import '../../../../../localization/language_service.dart';
import '../../../controllers/admin_controller.dart';
import '../../../controllers/student_profile_controller.dart';
import '../../../controllers/setting_controller.dart';
import '../../dashboard/admin/admin_dashboard.dart';

class AdminSettingPage extends StatelessWidget {
  const AdminSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingController = Get.put(SettingController());
    // Dung chung cai dat dark mode voi profile controller
    final adminController = Get.put(AdminController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          LanguageService.cSettings,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LanguageService.cAppearance,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        LanguageService.cDarkMode,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Switch(
                      thumbIcon: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Icon(LineAwesomeIcons.moon);
                          }
                          return const Icon(LineAwesomeIcons.sun);
                        },
                      ),
                      value: adminController.isDarkMode.value,
                      onChanged: (value) {
                        adminController.toggleDarkMode(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              LanguageService.cLanguage,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(
              () => RadioListTile(
                title: Text(LanguageService.cEnglish),
                value: "en",
                groupValue:
                    settingController.selectedLanguage.toString(),
                onChanged: (value) {
                  settingController.selectedLanguage.value = value!;
                  settingController.changeLanguage();
                  Get.offAll(() => const AdminDashboard());
                },
              ),
            ),
            Obx(
              () => RadioListTile(
                title: Text(LanguageService.cRussian),
                value: "ru",
                groupValue:
                    settingController.selectedLanguage.toString(),
                onChanged: (value) {
                  settingController.selectedLanguage.value = value!;
                  settingController.changeLanguage();
                  Get.offAll(() => const AdminDashboard());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
