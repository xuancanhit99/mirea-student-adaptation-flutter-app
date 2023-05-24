import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/sizes.dart';
import 'package:msa/src/features/authentication/screens/login/admin/widget/admin_login_form_widget.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../localization/language_service.dart';
import '../student/student_login_screen.dart';
import 'widget/admin_login_footer_widget.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => const StudentLoginScreen());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => Get.off(() => const StudentLoginScreen()),
                icon: const Icon(LineAwesomeIcons.angle_left),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(cDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormHeaderWidget(
                      image: cWelcomeImage,
                      title: LanguageService.cAdminLogin,
                      subtitle:
                          '${LanguageService.cAppName} - ${LanguageService.cAppNameDetailed}'),
                  const AdminLoginFormWidget(),
                  const AdminLoginFooterWidget(),
                ],
              ),
            ))),
      ),
    );
  }
}
