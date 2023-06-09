import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:msa/src/features/core/screens/curator/curator_info.dart';
import 'package:msa/src/features/core/screens/imo/imo.dart';

import '../../../../../../constants/assets_strings.dart';
import '../../../../../../constants/variables.dart';
import '../../../../../../localization/language_service.dart';
import '../../../../../authentication/models/student_model.dart';
import '../../../../controllers/curator_controller.dart';
import '../../../../controllers/student_profile_controller.dart';
import '../../../details/student_study_details_page.dart';
import '../../../profile/student/student_profile_page.dart';

class StudentDashboardBanners extends StatelessWidget {
  const StudentDashboardBanners({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final studentProfileController = Get.put(StudentProfileController());
    return StreamBuilder<StudentModel>(
      stream: studentProfileController.getStudentFromUid(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error fetching student details.'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final studentData = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Institute of International Education
            Card(
                color: Theme.of(context).colorScheme.onPrimary,
                // color: cPrimaryColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Get.to(() => const IMO());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(LineAwesomeIcons.door_closed,
                                  color: Theme.of(context).colorScheme.outline),
                              const SizedBox(
                                height: 55,
                              ),
                              Text(
                                LanguageService
                                    .cInstituteOfInternationalEducation,
                                style: txtTheme.headlineSmall
                                    ?.copyWith(fontSize: 20),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Text.rich(TextSpan(
                              //     text: cUpdatedAt,
                              //     style: txtTheme.bodySmall,
                              //     children: [
                              //       TextSpan(
                              //           text: studentProfileController.getDate(
                              //               studentProfileController.updateAt.value),
                              //           style: const TextStyle(
                              //               fontWeight: FontWeight.bold, fontSize: 12)),
                              //     ])),
                            ],
                          ),
                        ),
                        const Flexible(
                            child:
                                // Lottie.asset(
                                //     frameRate: FrameRate.max,
                                //     cDataManagementJson
                                // ),
                                Image(image: AssetImage(cDataManagement)))
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      // My Profile
                      Card(
                        color: Theme.of(context).colorScheme.onPrimary,
                        // color: cPrimaryColor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Get.to(() => const StudentProfilePage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        child: Icon(LineAwesomeIcons.cog,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline)),
                                    const Flexible(
                                      child: Icon(Icons.person_outline_sharp,
                                          size: 70),
                                      // Image(image: AssetImage(cUserProfileImage))
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  LanguageService.cMyProfile,
                                  style: txtTheme.headlineSmall
                                      ?.copyWith(fontSize: 20),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text.rich(TextSpan(
                                    text: LanguageService.cUpdatedAt,
                                    style: txtTheme.bodySmall,
                                    children: [
                                      TextSpan(
                                          text: studentProfileController
                                              .getDate(studentProfileController
                                                  .updateAt.value),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ])),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // University Map
                      Card(
                        color: Theme.of(context).colorScheme.onPrimary,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            final url = Uri.parse(cLinkSchemeMIREA);
                            studentProfileController.launchInWebViewOrVC(url);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        child: Icon(
                                            LineAwesomeIcons.street_view,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline)),
                                    const Flexible(
                                      child:
                                          Icon(LineAwesomeIcons.map, size: 70),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  LanguageService.cUniversityMap,
                                  style: txtTheme.headlineSmall
                                      ?.copyWith(fontSize: 20),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  children: [
                    // Study Details
                    Card(
                      color: Theme.of(context).colorScheme.onPrimary,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Get.to(() => const StudentStudyDetailsPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                      child: Icon(LineAwesomeIcons.cog,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline)),
                                  const Flexible(
                                    child: Icon(LineAwesomeIcons.university,
                                        size: 70),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                LanguageService.cStudyDetails,
                                style: txtTheme.headlineSmall
                                    ?.copyWith(fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Text(
                              //   cDashboardBannerSubTitle,
                              //   style: txtTheme.bodySmall,
                              //   overflow: TextOverflow.ellipsis,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Study Schedule
                    Card(
                      color: Theme.of(context).colorScheme.onPrimary,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          final url = Uri.parse(cLinkScheduleMIREA);
                          studentProfileController.launchInWebViewOrVC(url);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                      child: Icon(LineAwesomeIcons.binoculars,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline)),
                                  const Flexible(
                                    child: Icon(LineAwesomeIcons.calendar,
                                        size: 70),
                                    // Image(image: AssetImage(cUserProfileImage))
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                LanguageService.cStudySchedule,
                                style: txtTheme.headlineSmall
                                    ?.copyWith(fontSize: 20),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text.rich(TextSpan(
                                  text: LanguageService.cTodayIs,
                                  style: txtTheme.bodySmall,
                                  children: [
                                    TextSpan(
                                        text: studentProfileController
                                            .getCurrentTime(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 10),
            // Frequently Asked Questions
            Card(
                color: Theme.of(context).colorScheme.onPrimary,
                // color: cPrimaryColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    final url = Uri.parse(cLinkFAQsMIREA);
                    studentProfileController.launchInWebViewOrVC(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(LineAwesomeIcons.comments,
                                  color: Theme.of(context).colorScheme.outline),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                LanguageService.cFrequentlyAskedQuestions,
                                style: txtTheme.headlineSmall
                                    ?.copyWith(fontSize: 20),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Text.rich(TextSpan(
                              //     text: cUpdatedAt,
                              //     style: txtTheme.bodySmall,
                              //     children: [
                              //       TextSpan(
                              //           text: studentProfileController.getDate(
                              //               studentProfileController.updateAt.value),
                              //           style: const TextStyle(
                              //               fontWeight: FontWeight.bold, fontSize: 12)),
                              //     ])),
                            ],
                          ),
                        ),
                        const Flexible(
                            child:
                                // Lottie.asset(
                                //     frameRate: FrameRate.max,
                                //     cSupportCentre2Json),
                                Image(image: AssetImage(cSupportCentre2)))
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            Text(
              LanguageService.cGroupCurator,
              style: txtTheme.headlineSmall?.apply(fontSizeFactor: 1.1),
            ),
            // Group Curator
            Card(
                color: Theme.of(context).colorScheme.onPrimary,
                // color: cPrimaryColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Get.to(() => const CuratorInfo());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 30, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(LineAwesomeIcons.identification_card,
                                  color: Theme.of(context).colorScheme.outline),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Александр Соколов",
                                style: txtTheme.headlineSmall
                                    ?.copyWith(fontSize: 20),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Text.rich(TextSpan(
                              //     text: cUpdatedAt,
                              //     style: txtTheme.bodySmall,
                              //     children: [
                              //       TextSpan(
                              //           text: studentProfileController.getDate(
                              //               studentProfileController.updateAt.value),
                              //           style: const TextStyle(
                              //               fontWeight: FontWeight.bold, fontSize: 12)),
                              //     ])),
                            ],
                          ),
                        ),
                        const Flexible(
                            child: SizedBox(
                                width: 100,
                                height: 100,
                                child: ClipOval(
                                    child: Image(
                                        image: AssetImage(cMan),
                                        fit: BoxFit.cover))))
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
