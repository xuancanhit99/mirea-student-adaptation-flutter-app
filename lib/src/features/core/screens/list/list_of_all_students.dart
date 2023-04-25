import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../controllers/student_controller.dart';



class ListOfAllStudents extends StatelessWidget {
  const ListOfAllStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: Text(
            "List of All Students",
            style: Theme
                .of(context)
                .textTheme
                .headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: FutureBuilder(
              future: controller.getAllStudent(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (c, index) {
                          return Column(
                            children: [
                              ListTile(
                                iconColor: Colors.blue,
                                tileColor: Colors.blue.withOpacity(0.1),
                                leading: const Icon(LineAwesomeIcons.user_1),
                                title: Text(
                                    "Name: ${snapshot.data![index].fullName}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data![index].phoneNo),
                                    Text(snapshot.data![index].email),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10)
                            ],
                          );
                        });
                  }
                  else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()),);
                  } else {
                    return const Center(child: Text("Something went wrong."),);
                  }
                } else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          ),
        ),
    );
  }
}
