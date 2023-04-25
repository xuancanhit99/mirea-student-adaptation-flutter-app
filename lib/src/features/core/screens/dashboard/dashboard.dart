import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/colors.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:msa/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:msa/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:msa/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:msa/src/features/core/screens/dashboard/widgets/top_courses.dart';

import '../../controllers/student_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentController = Get.put(StudentController());
    final txtTheme = Theme
        .of(context)
        .textTheme;

    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: studentController.getStudentFromUid(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  StudentModel studentData = snapshot.data as StudentModel;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading
                      Text(cDashboardHi + studentData.fullName, style: txtTheme.headlineSmall),
                      Text(cDashboardGroup + studentData.email, style: txtTheme.bodyMedium),
                      const SizedBox(height: 10),

                      // Search Box
                      DashboardSearchBox(txtTheme: txtTheme),
                      const SizedBox(height: 10),

                      // Categories
                      DashboardCategories(txtTheme: txtTheme),
                      const SizedBox(
                          height: 10
                      ),

                      // Banners
                      DashboardBanners(txtTheme: txtTheme),
                      const SizedBox(
                          height: 10
                      ),

                      // Top Course
                      Text(
                        cDashboardTopCourses,
                        style: txtTheme.headlineSmall?.apply(
                            fontSizeFactor: 1.2),
                      ),
                      DashboardTopCourses(txtTheme: txtTheme)
                    ],
                  );

                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong."),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}



