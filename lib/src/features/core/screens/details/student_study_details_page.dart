import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../localization/language_service.dart';
import '../../../authentication/models/student_model.dart';
import '../../controllers/student_profile_controller.dart';
import '../profile/admin/ex_admin_student_update_profile_page.dart';
import '../profile/student/student_update_profile_page.dart';

class StudentStudyDetailsPage extends StatelessWidget {
  const StudentStudyDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentProfileController = Get.put(StudentProfileController());
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          LanguageService.cStudyDetails,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text: "${LanguageService.cYearOfAdmission}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData
                                          .studyDetails.yearOfAdmission,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      color: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text: "${LanguageService.cFormingDivision}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData
                                          .studyDetails.formingDivision,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text: "${LanguageService.cIssuingDivision}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData
                                          .studyDetails.issuingDivision,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      color: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text:
                                    "${LanguageService.cTypeOfEducationalProgram}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData.studyDetails
                                          .typeOfEducationalProgram,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text: "${LanguageService.cDirectionOfTraining}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData
                                          .studyDetails.directionOfTraining,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      color: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text: "${LanguageService.cSpeciality}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData.studyDetails.speciality,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text: "${LanguageService.cTypeOfCostRecovery}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData
                                          .studyDetails.typeOfCostRecovery,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      color: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text: "${LanguageService.cQualificationGiven}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData
                                          .studyDetails.qualificationGiven,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text:
                                    "${LanguageService.cStandardDevelopmentPeriod}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData.studyDetails
                                          .standardDevelopmentPeriod,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      color: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text: "${LanguageService.cFormOfLearning}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData
                                          .studyDetails.formOfLearning,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text.rich(TextSpan(
                                text: "${LanguageService.cTargetReception}: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                children: [
                                  TextSpan(
                                      text: studentData
                                          .studyDetails.targetReception,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )),
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
                            child: Text(LanguageService.cEditProfile.toUpperCase()))),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
