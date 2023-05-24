import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:msa/src/features/core/screens/dashboard/widgets/banners.dart';

import '../../../../localization/language_service.dart';
import '../../controllers/student_profile_controller.dart';
import '../navigation_drawer/student/student_navigation_drawer.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentController = Get.put(StudentProfileController());
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      drawer: const StudentNavigationDrawer(),
      appBar: const DashboardAppBar(),
      body: StreamBuilder<StudentModel>(
        stream: studentController.getStudentFromUid(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching student details.'));
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
                  // Heading
                  Text("${LanguageService.cDashboardHi}, ${studentData.fullName}",
                      style: txtTheme.headlineSmall),
                  Text("${LanguageService.cDashboardGroup}: ${studentData.group}",
                      style: txtTheme.bodyMedium),
                  const SizedBox(height: 10),

                  // // Search Box
                  // DashboardSearchBox(txtTheme: txtTheme),
                  // const SizedBox(height: 10),
                  //
                  // // Categories
                  // DashboardCategories(txtTheme: txtTheme),
                  // const SizedBox(
                  //     height: 10
                  // ),

                  // Banners
                  StudentDashboardBanners(txtTheme: txtTheme),
                  const SizedBox(height: 10),

                  // Top Course
                  // Text(
                  //   cDashboardTopCourses,
                  //   style: txtTheme.headlineSmall?.apply(
                  //       fontSizeFactor: 1.2),
                  // ),
                  // DashboardTopCourses(txtTheme: txtTheme)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
