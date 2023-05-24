import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../localization/language_service.dart';
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
            return const Center(child: Text('Error fetching student details.'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
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
                                        " ${LanguageService.cReceptionHours}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Text(
                                      "${LanguageService.cMon}${LanguageService.c918}"),
                                  Text(
                                      "${LanguageService.cTue}${LanguageService.c918}"),
                                  Text(
                                      "${LanguageService.cWed}${LanguageService.c918}"),
                                  Text(
                                      "${LanguageService.cThu}${LanguageService.c918}"),
                                  Text(
                                      "${LanguageService.cFri}${LanguageService.c917}"),
                                ]),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      imoStaffData.fullName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      imoStaffData.position,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text.rich(TextSpan(
                        text: "${LanguageService.cAddress}: ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.outline),
                        children: [
                          TextSpan(
                            text: imoStaffData.address,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        ])),
                    Text.rich(TextSpan(
                        text: "${LanguageService.cOffice}: ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.outline),
                        children: [
                          TextSpan(
                              text: imoStaffData.office,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: " ${LanguageService.cPhone}: ",
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
                                                  fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text: " ${LanguageService.cExt} ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .outline),
                                                children: [
                                                  TextSpan(
                                                    text: imoStaffData.ext,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  )
                                                ])
                                          ])
                                    ])
                              ])
                        ])),
                    Text.rich(TextSpan(
                        text: "${LanguageService.cEmail}: ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.outline),
                        children: [
                          TextSpan(
                            text: imoStaffData.email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        ])),
                    const SizedBox(height: 20),
                    Text.rich(TextSpan(
                        text: "${LanguageService.cInfoTitle1} ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: LanguageService.cInfoSubTitle1,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ])),
                    const SizedBox(height: 10),
                    Text.rich(TextSpan(
                        text: "${LanguageService.cInfoTitle2} \n",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: LanguageService.cInfoSubTitle2,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ])),
                  ]),
            ),
          );
        });
  }
}
