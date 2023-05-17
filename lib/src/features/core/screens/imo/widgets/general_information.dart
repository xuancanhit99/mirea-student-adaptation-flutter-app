import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/text_strings.dart';
import '../../../controllers/imo_controller.dart';
import '../../../models/imo_staff_model.dart';


class IMOGeneralInfo extends StatelessWidget {
  const IMOGeneralInfo({
    super.key,
    required this.imoController,
  });

  final IMOController imoController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<IMOStaffModel>(
        stream: imoController.getIMOStaffFromUid("1"),
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
          final imoStaffData = snapshot.data!;
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 150,
                            child: Image.network(
                              imoStaffData.img,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
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
                                      Text(
                                        " $cReceptionHours",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      )
                                    ],
                                  ),
                                  const Text("Mon$c918"),
                                  const Text("Tue$c918"),
                                  const Text("Wed$c918"),
                                  const Text("Thu$c918"),
                                  const Text("Fri$c917"),
                                ]),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      imoStaffData.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall,
                    ),
                    Text(
                      imoStaffData.position,
                      style:
                      Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text.rich(TextSpan(
                        text: "$cAddress: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .outline),
                        children: [
                          TextSpan(
                            text: imoStaffData.address,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                    Text.rich(TextSpan(
                        text: "$cOffice: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .outline),
                        children: [
                          TextSpan(
                              text: imoStaffData.office,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: " $cPhone: ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                    children: [
                                      TextSpan(
                                          text: imoStaffData.phone,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                              fontWeight:
                                              FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text: " $cExt ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .outline),
                                                children: [
                                                  TextSpan(
                                                    text: imoStaffData
                                                        .ext,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                    ]
                                )
                              ]
                          )
                        ])),
                    Text.rich(TextSpan(
                        text: "$cEmail: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .outline),
                        children: [
                          TextSpan(
                            text: imoStaffData.email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                    const SizedBox(height: 20),
                    Text.rich(TextSpan(
                        text: "$cInfoTitle1 ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith( fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: cInfoSubTitle1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium,
                          )
                        ])),
                    const SizedBox(height: 10),
                    Text.rich(TextSpan(
                        text: "$cInfoTitle2 \n",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith( fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: cInfoSubTitle2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium,
                          )
                        ])),
                  ]),
            ),
          );
        });
  }
}
