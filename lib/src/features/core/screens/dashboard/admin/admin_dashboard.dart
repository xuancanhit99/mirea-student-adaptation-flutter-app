import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/features/core/controllers/setting_controller.dart';
import 'package:msa/src/features/core/screens/dashboard/admin/widgets/admin_appbar.dart';
import 'package:msa/src/features/core/screens/dashboard/admin/widgets/admin_banners.dart';
import 'package:msa/src/features/core/screens/dashboard/student/widgets/student_appbar.dart';
import 'package:msa/src/features/core/screens/dashboard/student/widgets/student_banners.dart';

import '../../../../../localization/language_service.dart';
import '../../../../authentication/models/admin_model.dart';
import '../../../controllers/admin_controller.dart';
import '../../navigation_drawer/admin/admin_navigation_drawer.dart';
import '../../navigation_drawer/student/student_navigation_drawer.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminController = Get.put(AdminController());
    final studentSettingController = Get.put(SettingController());
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      drawer: const AdminNavigationDrawer(),
      appBar: const AdminDashboardAppBar(),
      body: StreamBuilder<AdminModel>(
        stream: adminController.getAdminByUidRealtime(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching student details.'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final adminData = snapshot.data!;
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text("${LanguageService.cDashboardHi}, ${adminData.fullName}",
                      style: txtTheme.headlineSmall),
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

                  //Banners
                  AdminDashboardBanners(txtTheme: txtTheme),
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
