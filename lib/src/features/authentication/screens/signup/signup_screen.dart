import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/common_widgets/form/form_header_widget.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/sizes.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/authentication/screens/signup/widget/signup_footer_widget.dart';
import 'package:msa/src/features/authentication/screens/signup/widget/signup_form_widget.dart';

import '../login/student/student_login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
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
                children: const [
                  FormHeaderWidget(
                      image: cWelcomeImage,
                      title: cStudentRegister,
                      subtitle: '$cAppName - $cAppNameDetailed'),
                  SignUpFormWidget(),
                  SignUpFooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
