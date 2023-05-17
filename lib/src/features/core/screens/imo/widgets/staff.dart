import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../controllers/imo_controller.dart';
import '../../../models/imo_staff_model.dart';

class IMOStaff extends StatelessWidget {
  const IMOStaff({
    super.key,
    required this.imoController,
  });

  final IMOController imoController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<IMOStaffModel>>(
        stream: imoController.getAllIMOStaff(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('Error fetching staff details ${snapshot.error}'));
          }
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator());
          }
          final imoListStaffData = snapshot.data!;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
            ListView.builder(
                shrinkWrap: true,
                itemCount: imoListStaffData.length,
                itemBuilder: (context, index) {
                  final staff = imoListStaffData[index];
                  // final isEvenItem = index % 2 == 0;
                  // final tileColor = isEvenItem ? Colors.white : Colors.blue.withOpacity(0.1);
                  final tileColor = Colors.blue.withOpacity(0.1);
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: tileColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          // iconColor: Colors.blue,
                          // tileColor: tileColor,
                          leading: Image(
                            image: NetworkImage(staff.img),
                            // width: 50,
                            // height: 50,
                          ),
                          title: Text(staff.fullName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                          subtitle: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              Text(
                                staff.position,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                mainAxisSize:
                                MainAxisSize.max,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    LineAwesomeIcons.map_marked,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline,
                                  ),
                                  Flexible(
                                    child: Text(
                                      " ${staff.address}",
                                      overflow: TextOverflow.ellipsis,

                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                mainAxisSize:
                                MainAxisSize.max,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    LineAwesomeIcons.door_open,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline,
                                  ),
                                  Text(
                                    " ${staff.office}",
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                mainAxisSize:
                                MainAxisSize.max,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    LineAwesomeIcons.mobile_phone,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline,
                                  ),
                                  Text(
                                    " ${staff.phone}",
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                mainAxisSize:
                                MainAxisSize.max,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    LineAwesomeIcons.tty,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline,
                                  ),
                                  Text(
                                    " ${staff.ext}",
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                mainAxisSize:
                                MainAxisSize.max,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    LineAwesomeIcons.envelope,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline,
                                  ),
                                  Text(
                                    " ${staff.email}",
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  );
                }),
          );
        });
  }
}