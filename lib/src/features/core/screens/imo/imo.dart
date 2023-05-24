import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/variables.dart';
import 'package:msa/src/features/core/screens/imo/widgets/contacts.dart';
import 'package:msa/src/features/core/screens/imo/widgets/general_information.dart';
import 'package:msa/src/features/core/screens/imo/widgets/staff.dart';

import '../../../../localization/language_service.dart';
import '../../controllers/imo_controller.dart';

class IMO extends StatelessWidget {
  const IMO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imoController = Get.put(IMOController());
    return DefaultTabController(
      length: 3, // length of tabs
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            label: Text(LanguageService.cInternationalStudentDepartment),
            icon: const Icon(LineAwesomeIcons.door_open),
            onPressed: () {
              final url = Uri.parse(cLinkInternationalStudentDepartment);
              imoController.launchInWebViewOrVC(url);
            },
          ),
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    leading: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(LineAwesomeIcons.angle_left),
                    ),
                    title: Text(LanguageService.cIMO,
                        style: Theme.of(context).textTheme.headlineSmall),
                    centerTitle: true,
                    pinned: true,
                    floating: true,
                    bottom: TabBar(
                      // indicatorSize: TabBarIndicatorSize.tab,
                      // isScrollable: true,
                      tabs: [
                        Tab(child: Text(LanguageService.cGeneralInformation)),
                        Tab(child: Text(LanguageService.cContact)),
                        Tab(child: Text(LanguageService.cStaff)),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  IMOGeneralInfo(imoController: imoController),
                  IMOContact(imoController: imoController),
                  IMOStaff(imoController: imoController),
                ],
              ))),
    );
  }
}
