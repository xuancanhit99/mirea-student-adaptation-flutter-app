import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../localization/language_service.dart';
import '../../../controllers/student_profile_controller.dart';
import '../../../controllers/student_setting_controller.dart';

class StudentSettingPage extends StatelessWidget {
  const StudentSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final studentSettingController = Get.put(StudentSettingController());
    // Dung chung cai dat dark mode voi profile controller
    final studentProfileController = Get.put(StudentProfileController());
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
                      value: studentProfileController.isDarkMode.value,
                      onChanged: (value) {
                        studentProfileController.toggleDarkMode(value);
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
                    studentSettingController.selectedLanguage.toString(),
                onChanged: (value) {
                  studentSettingController.selectedLanguage.value = value!;
                  studentSettingController.changeLanguage();
                  Get.back();
                },
              ),
            ),
            Obx(
              () => RadioListTile(
                title: Text(LanguageService.cRussian),
                value: "ru",
                groupValue:
                    studentSettingController.selectedLanguage.toString(),
                onChanged: (value) {
                  studentSettingController.selectedLanguage.value = value!;
                  studentSettingController.changeLanguage();
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
