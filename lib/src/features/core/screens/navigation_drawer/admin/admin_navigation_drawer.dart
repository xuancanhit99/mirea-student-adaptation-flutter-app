import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/variables.dart';
import 'package:msa/src/features/core/screens/curator/curator_info.dart';
import 'package:msa/src/features/core/screens/details/student_study_details_page.dart';
import 'package:msa/src/features/core/screens/imo/imo.dart';
import 'package:msa/src/features/core/screens/list/list_of_all_students.dart';
import 'package:msa/src/features/core/screens/navigation_drawer/drawer_item.dart';

import '../../../../../constants/assets_strings.dart';
import '../../../../../localization/language_service.dart';
import '../../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../controllers/admin_controller.dart';
import '../../../controllers/student_profile_controller.dart';
import '../../profile/student/student_profile_page.dart';

class AdminNavigationDrawer extends StatelessWidget {
  const AdminNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminController = Get.put(AdminController());
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
                      child: adminController.img.value != ""
                          ? Image.network(adminController.img.value,
                              fit: BoxFit.cover)
                          : Image.asset(cUserProfileImage, fit: BoxFit.cover),
                    )),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(adminController.fullName.text,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(adminController.email.text),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              DrawerItem(
                  name: LanguageService.cStudentList,
                  icon: LineAwesomeIcons.list,
                  onPressed: () => Get.to(() => const ListOfAllStudents())),
              DrawerItem(
                  name: LanguageService.cCuratorList,
                  icon: LineAwesomeIcons.address_card,
                  onPressed: () =>
                      Get.to(() => const StudentStudyDetailsPage())),
              const SizedBox(height: 20),
              DrawerItem(
                  name: LanguageService.cUniversityMap,
                  icon: Icons.map_outlined,
                  onPressed: () {
                    final url = Uri.parse(cLinkSchemeMIREA);
                    adminController.launchInWebViewOrVC(url);
                  }),
              DrawerItem(
                  name: LanguageService.cStudySchedule,
                  icon: Icons.calendar_month_outlined,
                  onPressed: () {
                    final url = Uri.parse(cLinkScheduleMIREA);
                    adminController.launchInWebViewOrVC(url);
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
                    adminController.launchInWebViewOrVC(url);
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
