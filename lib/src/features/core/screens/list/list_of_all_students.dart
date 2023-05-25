import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/features/core/screens/profile/admin/ex_admin_student_update_profile_page.dart';
import 'package:msa/src/localization/language_service.dart';

import '../../../../constants/assets_strings.dart';
import '../../controllers/admin_controller.dart';
import '../../controllers/admin_student_update_profile_controller.dart';
import '../../controllers/student_profile_controller.dart';
import '../profile/admin/admin_student_update_profile_page.dart';

class ListOfAllStudents extends StatelessWidget {
  const ListOfAllStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminController = Get.put(AdminController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          LanguageService.cStudentList,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
            future: adminController.getAllStudent(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final studentList = snapshot.data!;
                  final tileColor = Colors.blue.withOpacity(0.1);
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: studentList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: tileColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Get.off(() => AdminStudentUpdateProfilePage(
                                      student: studentList[index]));
                                },
                                // iconColor: Colors.blue,
                                // tileColor: Colors.blue.withOpacity(0.1),
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: ClipOval(
                                      child: SizedBox.fromSize(
                                    child: studentList[index].img != ""
                                        ? Image.network(studentList[index].img!,
                                            fit: BoxFit.cover)
                                        : Image.asset(cUserProfileImage,
                                            fit: BoxFit.cover),
                                  )),
                                ),
                                title: Text(studentList[index].fullName),
                                subtitle: Row(
                                  children: [
                                    Expanded(
                                        flex: 5,
                                        child: Text(studentList[index].group)),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 20,
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: Switch(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            thumbIcon: MaterialStateProperty
                                                .resolveWith(
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
                                            value: studentList[index].isActive!,
                                            onChanged: null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20)
                          ],
                        );
                      });
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
