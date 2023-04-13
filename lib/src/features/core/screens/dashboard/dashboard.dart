import 'package:flutter/material.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/constants/text_strings.dart';
import 'package:misafu/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:misafu/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:misafu/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:misafu/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:misafu/src/features/core/screens/dashboard/widgets/top_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text(cDashboardTitle, style: txtTheme.bodyMedium),
              Text(cDashboardHeading, style: txtTheme.headlineSmall),
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
                style: txtTheme.headlineSmall?.apply(fontSizeFactor: 1.2),
              ),
              DashboardTopCourses(txtTheme: txtTheme)
            ],
          ),
        ),
      ),
    );
  }
}



