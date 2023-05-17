import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/text_strings.dart';
import '../../../controllers/imo_controller.dart';
import '../../../models/imo_contact_model.dart';


class IMOContact extends StatelessWidget {
  const IMOContact({
    super.key,
    required this.imoController,
  });

  final IMOController imoController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<IMOContactModel>>(
        stream: imoController.getAllIMOContact(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child: Text('Error fetching student details.'));
          }
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator());
          }
          final imoListContactData = snapshot.data!;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: imoListContactData.length,
                itemBuilder: (context, index) {
                  final contact = imoListContactData[index];
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
                          // leading:
                          //     const Icon(LineAwesomeIcons.door_open),
                          title: Text(contact.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
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
                                  Text(
                                    " ${contact.address}",
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
                                    " ${contact.office}",
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
                                    " ${contact.phone}",
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
                                    " ${contact.ext}",
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    mainAxisSize:
                                    MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        LineAwesomeIcons.clock,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                      const Text(
                                        " $cReceptionHours",
                                      )
                                    ],
                                  ),
                                  const Text("Mon$c918"),
                                  const Text("Tue$c918"),
                                  const Text("Wed$c918"),
                                  const Text("Thu$c918"),
                                  const Text("Fri$c917"),
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