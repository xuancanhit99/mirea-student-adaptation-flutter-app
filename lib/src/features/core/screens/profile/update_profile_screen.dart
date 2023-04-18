import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/colors.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/features/core/controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          cEditProfile,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
            future: controller.getStudentData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  StudentModel studentData = snapshot.data as StudentModel;

                  final id = TextEditingController(text: studentData.id);
                  final email = TextEditingController(text: studentData.email);
                  final password =
                      TextEditingController(text: studentData.password);
                  final fullName =
                      TextEditingController(text: studentData.fullName);
                  final phoneNo =
                      TextEditingController(text: studentData.phoneNo);

                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage(cShinzImage),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: cPrimaryColor),
                                child: const Icon(
                                  LineAwesomeIcons.camera,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: fullName,
                            // initialValue: studentData.fullName,
                            decoration: const InputDecoration(
                                label: Text(cFullName),
                                prefixIcon:
                                    Icon(Icons.person_outline_outlined)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: email,
                            // initialValue: studentData.email,
                            decoration: const InputDecoration(
                                label: Text(cEmail),
                                prefixIcon: Icon(Icons.email_outlined)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: phoneNo,
                            // initialValue: studentData.phoneNo,
                            decoration: const InputDecoration(
                                label: Text(cPhoneNo),
                                prefixIcon: Icon(Icons.phone_outlined)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: password,
                            // initialValue: studentData.password,
                            decoration: const InputDecoration(
                                label: Text(cPassword),
                                prefixIcon: Icon(Icons.lock_outlined)),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final student = StudentModel(
                                    id: id.text,
                                    email: email.text.trim(),
                                    password: password.text.trim(),
                                    fullName: fullName.text.trim(),
                                    phoneNo: phoneNo.text.trim());
                                await controller.updateStudent(student);
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
                              const Text.rich(TextSpan(
                                  text: cJoined,
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text: cJoinedAt,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))
                                  ])),
                              ElevatedButton(
                                  onPressed: () {},
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
