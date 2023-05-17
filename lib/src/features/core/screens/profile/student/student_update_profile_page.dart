import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/colors.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/features/core/controllers/student_profile_controller.dart';

import '../../../controllers/institute_controller.dart';

class StudentUpdateProfilePage extends StatelessWidget {
  const StudentUpdateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentProfileController = Get.put(StudentProfileController());
    final instituteController = Get.put(InstituteController());
    final formKey = GlobalKey<FormState>();
    PhoneNumber number = PhoneNumber(isoCode: 'RU');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          cStudentUpdateProfile,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Obx(() => studentProfileController.img.value == ""
                          ? Image.asset(cUserProfileImage, fit: BoxFit.cover)
                          : Image.network(studentProfileController.img.value,
                          fit: BoxFit.cover)),
                    ),
                  ),
                  // Change profile image
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTapDown: (details) async {
                          final selectedOption = await showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                details.globalPosition.dx,
                                details.globalPosition.dy,
                                details.globalPosition.dx + 50,
                                details.globalPosition.dy + 50,
                              ),
                              items: [
                                const PopupMenuItem(
                                  value: 'take_photo',
                                  child: Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(
                                            LineAwesomeIcons.camera,
                                            size: 20,
                                          ),
                                        )),
                                    TextSpan(text: 'Take a photo')
                                  ])),
                                ),
                                const PopupMenuItem(
                                  value: 'select_photo',
                                  child: Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(
                                            LineAwesomeIcons.image,
                                            size: 20,
                                          ),
                                        )),
                                    TextSpan(text: 'Select a photo')
                                  ])),
                                )
                              ]);

                          if (selectedOption == 'take_photo') {
                            // Handle "Take a photo" option
                            final String? imgUrl =
                            await studentProfileController.takePhoto();
                            studentProfileController.img.value = imgUrl!;
                          } else if (selectedOption == 'select_photo') {
                            // Handle "Select a photo" option
                            final String? imgUrl =
                            await studentProfileController.selectPhoto();
                            studentProfileController.img.value = imgUrl!;
                          }
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: cPrimaryColor),
                          child: const Icon(
                            LineAwesomeIcons.image,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // ID
                      TextFormField(
                        controller: studentProfileController.no,
                        showCursor: false,
                        keyboardType: TextInputType.none,
                        readOnly: true,
                        decoration: const InputDecoration(
                            label: Text(cIDStudent),
                            prefixIcon: Icon(Icons.numbers_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter student's ID";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      // Full name
                      TextFormField(
                        controller: studentProfileController.fullName,
                        keyboardType: TextInputType.name,
                        // initialValue: studentData.fullName,
                        decoration: const InputDecoration(
                            label: Text(cFullName),
                            prefixIcon: Icon(Icons.person_outline_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter student's full name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      // Group
                      TextFormField(
                        controller: studentProfileController.group,
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
                                    title:
                                    Text(instituteController.groups[index]),
                                    onTap: () {
                                      studentProfileController.group.text =
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
                      ),
                      const SizedBox(height: 10),
                      // Email
                      TextFormField(
                        controller: studentProfileController.email,
                        showCursor: false,
                        keyboardType: TextInputType.none,
                        readOnly: true,
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
                      // Phone number
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber value) {
                            print(value.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          hintText: "Phone No",
                          initialValue: number,
                          spaceBetweenSelectorAndTextField: 0,
                          textFieldController: studentProfileController.phoneNo,
                          formatInput: true,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                          // onSaved: (PhoneNumber number) {
                          //   print('On Saved: $number');
                          // },
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Date of birth
                      TextFormField(
                        controller: studentProfileController.dob,
                        showCursor: false,
                        keyboardType: TextInputType.none,
                        readOnly: true,
                        onTap: () {
                          studentProfileController.selectDate(context);
                        },
                        decoration: const InputDecoration(
                            label: Text(cDateOfBirth),
                            prefixIcon: Icon(Icons.cake_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter student's date of birth";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      IntrinsicHeight(
                        // Dung cai nay de hien thi Divider
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    cGender,
                                  ),
                                )),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 19),
                              child: VerticalDivider(
                                color: Colors.black54,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Obx(
                                        () => RadioListTile(
                                      title: const Text(cMale),
                                      value: "male",
                                      groupValue: studentProfileController
                                          .gender
                                          .toString(),
                                      onChanged: (value) {
                                        studentProfileController.gender.value =
                                        value!;
                                      },
                                    ),
                                  ),
                                  Obx(
                                        () => RadioListTile(
                                      title: const Text(cFemale),
                                      value: "female",
                                      groupValue: studentProfileController
                                          .gender
                                          .toString(),
                                      onChanged: (value) {
                                        studentProfileController.gender.value =
                                        value!;
                                      },
                                    ),
                                  ),
                                  Obx(
                                        () => RadioListTile(
                                      title: const Text(cOther),
                                      value: "other",
                                      groupValue: studentProfileController
                                          .gender
                                          .toString(),
                                      onChanged: (value) {
                                        studentProfileController.gender.value =
                                        value!;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(cStatus),
                                )),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 19),
                              child: VerticalDivider(
                                color: Colors.black54,
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Obx(
                                      () => Switch(
                                    thumbIcon:
                                    MaterialStateProperty.resolveWith(
                                          (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return const Icon(Icons.check, color: Colors.green);
                                        }
                                        return const Icon(Icons.close, color: Colors.red);
                                      },
                                    ),
                                    value:
                                    studentProfileController.isActive.value,
                                    onChanged: null,
                                    // studentProfileController
                                    //     .toggleSwitchIsActive,
                                  ),
                                )),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      // Update button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              studentProfileController.updateAt.value =
                                  DateTime.now();
                              final student = StudentModel(
                                id: studentProfileController.id.text.trim(),
                                no: studentProfileController.no.text.trim(),
                                fullName: studentProfileController.fullName.text
                                    .trim(),
                                email:
                                studentProfileController.email.text.trim(),
                                password: studentProfileController.password.text
                                    .trim(),
                                group:
                                studentProfileController.group.text.trim(),
                                phoneNo: studentProfileController.phoneNo.text
                                    .trim(),
                                img: studentProfileController.img.value,
                                dob: studentProfileController.dob.text.trim(),
                                gender: studentProfileController.gender.value,
                                createdAt: studentProfileController.createAt,
                                updatedAt: DateTime.now(),
                                isActive:
                                studentProfileController.isActive.value,
                                isAdmin: false,
                              );
                              await studentProfileController
                                  .updateStudent(student);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: cPrimaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text(
                            "Update",
                            style: TextStyle(color: cDarkColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                    () => Text.rich(TextSpan(
                                    text: cUpdatedAt,
                                    style: const TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                          text: studentProfileController.getDate(studentProfileController.updateAt.value),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ])),

                              ),
                              Text.rich(TextSpan(
                                  text: cJoinedAt,
                                  style: const TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text: studentProfileController.getDate(
                                            studentProfileController.createAt),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ])),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () => showDialog(context: context, builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Delete all student data!"),
                                  content: const Text("Are you sure?"),
                                  actions: [
                                    TextButton(onPressed: () => Get.back(), child: const Text("No")),
                                    TextButton(onPressed: () {
                                      studentProfileController.deleteStudent();
                                      Get.back();
                                    }, child: const Text("Yes")),
                                  ],
                                );
                              }),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                                  elevation: 0,
                                  foregroundColor: Colors.red,
                                  shape: const StadiumBorder(),
                                  side: BorderSide.none),
                              child: const Text(cDelete))
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}