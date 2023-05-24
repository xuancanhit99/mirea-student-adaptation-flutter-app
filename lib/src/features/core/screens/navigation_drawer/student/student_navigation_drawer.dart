import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/variables.dart';
import 'package:msa/src/features/core/screens/curator/curator_info.dart';
import 'package:msa/src/features/core/screens/details/student_study_details_page.dart';
import 'package:msa/src/features/core/screens/imo/imo.dart';
import 'package:msa/src/features/core/screens/navigation_drawer/drawer_item.dart';

import '../../../../../constants/assets_strings.dart';
import '../../../../../localization/language_service.dart';
import '../../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../controllers/student_profile_controller.dart';
import '../../profile/student/student_profile_page.dart';

class StudentNavigationDrawer extends StatelessWidget {
  const StudentNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentProfileController = Get.put(StudentProfileController());
    return Drawer(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
          color: Theme.of(context).splashColor,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: ClipOval(
                        child: SizedBox.fromSize(
                      child: studentProfileController.img.value != ""
                          ? Image.network(studentProfileController.img.value,
                              fit: BoxFit.cover)
                          : Image.asset(cUserProfileImage, fit: BoxFit.cover),
                    )),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(studentProfileController.fullName.text,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(studentProfileController.group.text),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              DrawerItem(
                  name: LanguageService.cMyProfile,
                  icon: Icons.person,
                  onPressed: () => Get.to(() => const StudentProfilePage())),
              DrawerItem(
                  name: LanguageService.cStudyDetails,
                  icon: LineAwesomeIcons.university,
                  onPressed: () =>
                      Get.to(() => const StudentStudyDetailsPage())),
              const SizedBox(height: 20),
              DrawerItem(
                  name: LanguageService.cUniversityMap,
                  icon: Icons.map_outlined,
                  onPressed: () {
                    final url = Uri.parse('https://mirea.xyz/scheme');
                    studentProfileController.launchInWebViewOrVC(url);
                  }),
              DrawerItem(
                  name: LanguageService.cStudySchedule,
                  icon: Icons.calendar_month_outlined,
                  onPressed: () {
                    final url = Uri.parse('https://mirea.xyz');
                    studentProfileController.launchInWebViewOrVC(url);
                  }),
              const SizedBox(height: 20),
              DrawerItem(
                  name: LanguageService.cIMO,
                  icon: LineAwesomeIcons.door_closed,
                  onPressed: () => Get.to(() => const IMO())),
              DrawerItem(
                  name: LanguageService.cGroupCurator,
                  icon: LineAwesomeIcons.identification_card,
                  onPressed: () => Get.to(() => const CuratorInfo())),
              DrawerItem(
                  name: LanguageService.cFAQs,
                  icon: LineAwesomeIcons.comments,
                  onPressed: () {
                    final url = Uri.parse(cLinkFAQsMIREA);
                    studentProfileController.launchInWebViewOrVC(url);
                  }),
              const SizedBox(height: 50),
              DrawerItem(
                  name: LanguageService.cLogout,
                  icon: Icons.logout,
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(LanguageService.cLoggingOut),
                          content: Text(LanguageService.cAreYouSure),
                          actions: [
                            TextButton(
                                onPressed: () => Get.back(),
                                child: const Text("No")),
                            TextButton(
                                onPressed: () {
                                  AuthenticationRepository.instance
                                      .logoutAuthRepo();
                                },
                                child: const Text("Yes")),
                          ],
                        );
                      })),
              const SizedBox(height: 80),
              Text(
                LanguageService.cCopyright,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
