import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/core/screens/list/list_of_all_students.dart';
import 'package:msa/src/features/core/screens/profile/student/student_update_profile_page.dart';
import 'package:msa/src/features/core/screens/profile/widget/profile_menu.dart';
import 'package:msa/src/utils/string_casing_extension.dart';


import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../authentication/models/student_model.dart';

import '../../controllers/student_profile_controller.dart';
import '../profile/admin/admin_student_update_profile_page.dart';


class AdminProfileMenuPage extends StatelessWidget {
  const AdminProfileMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentProfileController = Get.put(StudentProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          cProfileMenu,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: StreamBuilder<StudentModel>(
          stream: studentProfileController.getStudentFromUid(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Error fetching student details.'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final studentData = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipOval(
                          child: SizedBox.fromSize(
                            child: studentData.img != ""
                                ? Image.network(studentData.img!,
                                fit: BoxFit.cover)
                                : Image.asset(cUserProfileImage,
                                fit: BoxFit.cover),
                          )),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(studentData.fullName,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const StudentUpdateProfilePage());
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text.rich(TextSpan(
                        text: "$cGender: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .outline),
                        children: [
                          TextSpan(
                            text: studentData.gender!
                                .toCapitalized(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                fontWeight:
                                FontWeight.bold),
                          )
                        ])),
                    const SizedBox(height: 5),
                    Text.rich(TextSpan(
                        text: "$cAge: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .outline),
                        children: [
                          TextSpan(
                            text: studentProfileController
                                .calculateAge(
                                studentData.dob!)
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                fontWeight:
                                FontWeight.bold),
                            children: [
                              TextSpan(
                                text:
                                " (${studentData.dob!})",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                    color:
                                    Theme.of(context)
                                        .colorScheme
                                        .outline),
                              )
                            ],
                          )
                        ])),

                    const SizedBox(
                      height: 20,
                    ),

                    const Divider(),
                    const SizedBox(
                      height: 30,
                    ),

                    // Menu
                    ProfileMenuWidget(
                      title: "Setting",
                      icon: LineAwesomeIcons.cog,
                      onPress: () {},
                    ),
                    ProfileMenuWidget(
                      title: "Time Table",
                      icon: LineAwesomeIcons.wallet,
                      onPress: () {},
                    ),
                    ProfileMenuWidget(
                      title: "User Management",
                      icon: LineAwesomeIcons.user_check,
                      onPress: () => Get.to(() => const ListOfAllStudents()),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileMenuWidget(
                        title: "Information",
                        icon: LineAwesomeIcons.info,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "Logout",
                        icon: LineAwesomeIcons.alternate_sign_out,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Logging out"),
                                content: const Text("Are you sure?"),
                                actions: [
                                  TextButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("No")),
                                  TextButton(
                                      onPressed: () {
                                        AuthenticationRepository.instance
                                            .logoutAuthRepo();
                                        // Get.back();
                                      },
                                      child: const Text("Yes")),
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
