import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/features/core/screens/profile/admin/ex_admin_student_update_profile_page.dart';
import 'package:msa/src/localization/language_service.dart';

import '../../../../constants/assets_strings.dart';
import '../../controllers/admin_controller.dart';
import '../../controllers/admin_student_update_profile_controller.dart';
import '../../controllers/curator_controller.dart';
import '../../controllers/student_profile_controller.dart';
import '../profile/admin/admin_student_update_profile_page.dart';

class CuratorList extends StatelessWidget {
  const CuratorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminController = Get.put(AdminController());
    final curatorController = Get.put(CuratorController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          LanguageService.cCuratorList,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
            future: adminController.getAllCurator(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final curatorList = snapshot.data!;
                  final tileColor = Colors.blue.withOpacity(0.1);
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: curatorList.length,
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
                                  // Get.off(() => AdminStudentUpdateProfilePage(
                                  //     student: curatorList[index]));
                                },
                                // iconColor: Colors.blue,
                                // tileColor: Colors.blue.withOpacity(0.1),
                                // leading: SizedBox(
                                //   width: 50,
                                //   height: 50,
                                //   child: ClipOval(
                                //       child: SizedBox.fromSize(
                                //         child: curatorList[index].img != ""
                                //             ? Image.network(curatorList[index].img!,
                                //             fit: BoxFit.cover)
                                //             : Image.asset(cUserProfileImage,
                                //             fit: BoxFit.cover),
                                //       )),
                                // ),
                                title: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: ClipOval(
                                          child: SizedBox.fromSize(
                                            child: curatorList[index].img != ""
                                                ? Image.network(curatorList[index].img,
                                                fit: BoxFit.cover)
                                                : Image.asset(cUserProfileImage, fit: BoxFit.cover),
                                          )),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(curatorList[index].fullName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ],
                                ),
                                subtitle: Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    const Divider(),
                                    const SizedBox(height: 10),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.phone_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .outline,
                                            ),
                                          ),
                                          const VerticalDivider(
                                            color: Colors.black54,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            flex: 3,
                                            child: GestureDetector(
                                              onTap: () => curatorController
                                                  .makePhoneCall(curatorList[index].phone),
                                              child: Text(
                                                curatorList[index].phone,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.email_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .outline,
                                            ),
                                          ),
                                          const VerticalDivider(
                                            color: Colors.black54,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            flex: 3,
                                            child: GestureDetector(
                                              onTap: () {
                                                final emailLaunchUri = Uri(
                                                    scheme: 'mailto',
                                                    path: curatorList[index].email,
                                                    queryParameters: {'subject': ""});
                                                curatorController
                                                    .launchInBrowser(emailLaunchUri);
                                              },
                                              child: Text(
                                                curatorList[index].email,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              FontAwesomeIcons.telegram,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .outline,
                                            ),
                                          ),
                                          const VerticalDivider(
                                            color: Colors.black54,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            flex: 3,
                                            child: GestureDetector(
                                              onTap: () {
                                                final telegramLaunchUri = Uri(
                                                    scheme: 'https',
                                                    path: curatorList[index].telegram);
                                                curatorController
                                                    .launchInBrowser(
                                                    telegramLaunchUri);
                                              },
                                              child: Text(
                                                curatorList[index].telegram,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                    fontWeight: FontWeight.bold, color: Colors.blue),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              FontAwesomeIcons.vk,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .outline,
                                            ),
                                          ),
                                          const VerticalDivider(
                                            color: Colors.black54,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            flex: 3,
                                            child: GestureDetector(
                                              onTap: () {
                                                final vkLaunchUri = Uri(
                                                    scheme: 'https',
                                                    path: curatorList[index].vk);
                                                curatorController
                                                    .launchInBrowser(vkLaunchUri);
                                              },
                                              child: Text(
                                                curatorList[index].vk,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                    fontWeight: FontWeight.bold, color: Colors.blue),
                                              ),
                                            ),
                                          )
                                        ],
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
