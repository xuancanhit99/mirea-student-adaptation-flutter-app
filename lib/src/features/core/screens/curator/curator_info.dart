import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/features/core/models/curator_model.dart';

import '../../../../localization/language_service.dart';
import '../../controllers/curator_controller.dart';

class CuratorInfo extends StatelessWidget {
  const CuratorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curatorController = Get.put(CuratorController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: Text(
            LanguageService.cCuratorInfo,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<CuratorModel>(
          stream: curatorController.getCuratorFromUid("1KnRMb2wCFXOYMFA6Wyx"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Error fetching curator details.'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final curatorData = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipOval(
                                    child: SizedBox.fromSize(
                                  child: curatorData.img != ""
                                      ? Image.network(curatorData.img,
                                          fit: BoxFit.cover)
                                      : Image.asset(cMan, fit: BoxFit.cover),
                                )),
                              ),
                              const SizedBox(height: 20),
                              Text(curatorData.fullName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              const SizedBox(height: 5),
                              const Divider(),
                              const SizedBox(height: 10),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.phone_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                    ),
                                    const VerticalDivider(
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 3,
                                      child: GestureDetector(
                                        onTap: () => curatorController
                                            .makePhoneCall(curatorData.phone),
                                        child: Text(
                                          curatorData.phone,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.email_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                    ),
                                    const VerticalDivider(
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 3,
                                      child: GestureDetector(
                                        onTap: () {
                                          final emailLaunchUri = Uri(
                                              scheme: 'mailto',
                                              path: curatorData.email,
                                              queryParameters: {'subject': ""});
                                          curatorController
                                              .launchInBrowser(emailLaunchUri);
                                        },
                                        child: Text(
                                          curatorData.email,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        FontAwesomeIcons.telegram,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                    ),
                                    const VerticalDivider(
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 3,
                                      child: GestureDetector(
                                        onTap: () {
                                          final telegramLaunchUri = Uri(
                                              scheme: 'https',
                                              path: curatorData.telegram);
                                          curatorController
                                              .launchInBrowser(
                                                  telegramLaunchUri);
                                        },
                                        child: Text(
                                          curatorData.telegram,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold, color: Colors.blue),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        FontAwesomeIcons.vk,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                    ),
                                    const VerticalDivider(
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 3,
                                      child: GestureDetector(
                                        onTap: () {
                                          final vkLaunchUri = Uri(
                                              scheme: 'https',
                                              path: curatorData.vk);
                                          curatorController
                                              .launchInBrowser(vkLaunchUri);
                                        },
                                        child: Text(
                                          curatorData.vk,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold, color: Colors.blue),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                final Uri smsLaunchUri = Uri(
                                  scheme: 'sms',
                                  path: curatorData.phone,
                                  queryParameters: <String, String>{
                                    'body': Uri.encodeComponent(''),
                                  },
                                );
                                curatorController.launchInBrowser(smsLaunchUri);
                              },
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide.none,
                                  shape: const StadiumBorder()),
                              child:
                                  Text(LanguageService.cMessagingWithCurator.toUpperCase()))),
                    ],
                  )),
            );
          },
        ));
  }
}
