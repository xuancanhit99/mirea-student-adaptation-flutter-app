import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/core/screens/list/list_of_all_students.dart';
import 'package:msa/src/features/core/screens/profile/admin_student_update_profile_page.dart';
import 'package:msa/src/features/core/screens/profile/widget/profile_menu.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../controllers/student_profile_controller.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

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
          cProfile,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                  child: const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(cShinz))),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  enabled: false,
                                  controller: studentProfileController.fullName,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    // hintStyle: Theme.of(context)
                                    //     .textTheme
                                    //     .bodyMedium
                                    //     ?.copyWith(
                                    //         color: Colors.grey.shade400),
                                    border: InputBorder.none,
                                  ),
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                const SizedBox(height: 5),
                                TextField(
                                  enabled: false,
                                  controller: studentProfileController.gender,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: InputBorder.none,
                                    prefix: Text("$cGender: "),
                                  ),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                // TextField(
                                //   enabled: false,
                                //   controller: studentProfileController.age,
                                //   decoration: const InputDecoration(
                                //     isDense: true,
                                //     contentPadding: EdgeInsets.zero,
                                //     border: InputBorder.none,
                                //     prefix: Text(cAge),
                                //   ),
                                //   style: Theme.of(context).textTheme.bodyLarge,
                                // ),
                                // Text(
                                //   "Age: 23 (14.09.1999)",
                                //   style: Theme.of(context).textTheme.bodyLarge,
                                // ),

                                Text(
                                  "Phone: +79858944005",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                Text(
                                  "Email: xuancanhit99@gmail.com",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                cGroup,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.outline),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "IKBO-07-19",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                cIDStudent,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.outline)
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "ABC12345",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                cCourse,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.outline),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "4",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                cStatus,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.outline),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Active",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Stack(
              //   children: [
              //     SizedBox(
              //       width: 120,
              //       height: 120,
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(100),
              //         child: const Image(image: AssetImage(cUserProfileImage)),
              //       ),
              //     ),
              //     Positioned(
              //       bottom: 0,
              //       right: 0,
              //       child: Container(
              //         width: 35,
              //         height: 35,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(100),
              //           color: cPrimaryColor,
              //         ),
              //         child: const Icon(
              //           LineAwesomeIcons.alternate_pencil,
              //           size: 20,
              //           color: Colors.black,
              //         ),
              //       ),
              //     )
              //   ],
              // ),

              const SizedBox(
                height: 10,
              ),
              Text(
                cProfileHeading,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                cProfileSubHeading,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () =>
                          Get.to(() => const AdminStudentUpdateProfilePage()),
                      style: ElevatedButton.styleFrom(
                          side: BorderSide.none, shape: const StadiumBorder()),
                      child: const Text(cEditProfile))),
              const SizedBox(
                height: 30,
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
                                  Get.back();
                                },
                                child: const Text("Yes")),
                          ],
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
