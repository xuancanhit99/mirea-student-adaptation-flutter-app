import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/controllers/student/student_signup_controller.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';

import '../../../../../common_widgets/list_alert_dialog/list_alert_dialog_widget.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../core/controllers/institute_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentSignUpController());
    final instituteController = Get.put(InstituteController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name
              TextFormField(
                controller: controller.fullNameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    label: Text(cFullName),
                    prefixIcon: Icon(Icons.person_outline_outlined)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Group
              TextFormField(
                controller: controller.groupController,
                showCursor: false,
                keyboardType: TextInputType.none,
                readOnly: true,
                onTap: () {
                  Get.bottomSheet(
                    BottomSheet(
                      onClosing: () {},
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                          itemCount: instituteController.groups.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(instituteController.groups[index]),
                            onTap: () {
                              controller.groupController.text =
                                  instituteController.groups[index];
                              Get.back();
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
                decoration: const InputDecoration(
                    label: Text(cGroup),
                    prefixIcon: Icon(Icons.class_outlined)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please choose your group';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Email
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    label: Text(cEmail),
                    prefixIcon: Icon(Icons.email_outlined)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!EmailValidator.validate(value, true)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Password
              Obx(() => TextFormField(
                    controller: controller.passwordController,
                    obscureText: !controller.showPassword.value,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        label: const Text(cPassword),
                        suffixIcon: IconButton(
                          onPressed: controller.toggleShowPassword,
                          icon: Icon(
                            controller.showPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.lock_outlined)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (controller.validatePassword.value == false) {
                        return 'Password is not matched';
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FlutterPwValidator(
                  width: 400,
                  height: 150,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  onSuccess: () {
                    controller.validatePassword.value = true;
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text("Password is matched")));
                  },
                  onFail: () {
                    controller.validatePassword.value = false;
                  },
                  controller: controller.passwordController,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // SignUpController.instance.signUpController(controller.email.text.trim(), controller.password.text.trim());
                          // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                          // Get.to(() => const OTPScreen());
                          final student = StudentModel(
                            no: "",
                            fullName: controller.fullNameController.text.trim(),
                            email: controller.emailController.text.trim(),
                            password: controller.passwordController.text.trim(),
                            group: controller.groupController.text.trim(),
                            phoneNo: "",
                            img: "",
                            dob: "",
                            gender: "",
                            address: const Address(
                                city: '',
                                street: '',
                                house: '',
                                building: '',
                                dormitory: '',
                                placeOfBirth: '',
                                nationality: ''
                            ),
                            studyDetails: const StudyDetails(
                                yearOfAdmission: '',
                                formingDivision: '',
                                issuingDivision: '',
                                typeOfEducationalProgram: '',
                                directionOfTraining: '',
                                speciality: '',
                                typeOfCostRecovery: '',
                                qualificationGiven: '',
                                standardDevelopmentPeriod: '',
                                formOfLearning: '',
                                targetReception: ''
                            ),
                            createdAt: controller.now,
                            updatedAt: controller.now,
                            isActive: false,
                            isAdmin: false,
                          );
                          StudentSignUpController.instance.signUpController(student);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                      ),
                      child: Text(cSignUp.toUpperCase())))
            ],
          )),
    );
  }
}
