import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:msa/src/features/core/screens/profile/profile_screen.dart';
import 'package:msa/src/features/core/screens/profile/student/student_profile_page.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';

import '../../../../../constants/assets_strings.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../authentication/models/student_model.dart';
import '../../../controllers/student_profile_controller.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final studentController = Get.put(StudentProfileController());
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text(
        cAppNameDetailed,
        style:
            Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16),
      ),
      centerTitle: true,
      elevation: 0,
      // backgroundColor: Colors.transparent,
      actions: [
        StreamBuilder<StudentModel>(
          stream: studentController.getStudentFromUid(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Error fetching student details.'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final studentData = snapshot.data!;
            return Container(
              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: cCardBgColor),
              child: IconButton(
                onPressed: () {
                  // AuthenticationRepository.instance.logout();
                  Get.to(() => const StudentProfilePage());
                },
                icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      child: studentData.img != ""
                          ? Image.network(studentData.img!,
                          fit: BoxFit.cover)
                          : Image.asset(cUserProfileImage,
                          fit: BoxFit.cover),
                    )
                  ),
                )
              ),
            );
          },

        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
