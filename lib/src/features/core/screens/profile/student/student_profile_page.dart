import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/features/core/screens/profile/student/student_update_profile_page.dart';
import 'package:msa/src/utils/string_casing_extension.dart';

import '../../../../../localization/language_service.dart';
import '../../../../authentication/models/student_model.dart';
import '../../../controllers/student_profile_controller.dart';

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
          LanguageService.cProfile,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
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
                                    child: studentData.img != ""
                                        ? Image.network(studentData.img!,
                                            fit: BoxFit.cover)
                                        : Image.asset(cUserProfileImage,
                                            fit: BoxFit.cover),
                                  )),
                                ),
                                const SizedBox(width: 30),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(studentData.fullName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      const SizedBox(height: 5),
                                      Text.rich(TextSpan(
                                          text: "${LanguageService.cGender}: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .outline),
                                          children: [
                                            TextSpan(
                                              text: studentProfileController.getMultiLangGender(studentData.gender!),
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
                                          text: "${LanguageService.cAge}: ",
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
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.phone_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline,
                                          ),
                                          Text(
                                            " +7${studentData.phoneNo!.toCapitalized()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mail_outlined,
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                Text(
                                  " ${studentData.email}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
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
                                      LanguageService.cGroup,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .outline),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      studentData.group,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(LanguageService.cIDStudent,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline)),
                                    const SizedBox(height: 5),
                                    Text(
                                      studentData.no!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      LanguageService.cCourse,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .outline),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      studentProfileController
                                          .getCourse(studentData.group)
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      LanguageService.cStatus,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .outline),
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      height: 20,
                                      child: Transform.scale(
                                        scale: 0.7,
                                        child: Switch(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          thumbIcon:
                                              MaterialStateProperty.resolveWith(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.selected)) {
                                                return const Icon(Icons.check,
                                                    color: Colors.green);
                                              }
                                              return const Icon(Icons.close,
                                                  color: Colors.red);
                                            },
                                          ),
                                          value: studentData.isActive!,
                                          onChanged: null,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(TextSpan(
                                text: "${LanguageService.cAddress}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                children: [
                                  TextSpan(
                                    text:
                                        "${"${studentData.address.city}, ${studentData.address.street}, ${studentData.address.house}"}k${studentData.address.building}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ])),
                            const SizedBox(height: 5),
                            Text.rich(TextSpan(
                                text: "${LanguageService.cDormitory}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                children: [
                                  TextSpan(
                                    text: "№${studentData.address.dormitory}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ])),
                            const SizedBox(height: 5),
                            Text.rich(TextSpan(
                                text: "${LanguageService.cPlaceOfBirth}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                children: [
                                  TextSpan(
                                    text: studentData.address.placeOfBirth,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ])),
                            const SizedBox(height: 5),
                            Text.rich(TextSpan(
                                text: "${LanguageService.cNationality}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                children: [
                                  TextSpan(
                                    text: studentData.address.nationality,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ])),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => Get.to(
                                () => const StudentUpdateProfilePage()),
                            style: ElevatedButton.styleFrom(
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: Text(
                                LanguageService.cEditProfile.toUpperCase()))),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
