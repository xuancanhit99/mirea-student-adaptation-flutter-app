import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:msa/src/features/core/models/curator_model.dart';
import 'package:msa/src/features/core/models/imo_staff_model.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../repository/curator_repository/curator_repository.dart';
import '../../../repository/imo_repository/imo_repository.dart';
import '../../../repository/student_repository/student_repository.dart';
import '../../authentication/models/student_model.dart';
import '../models/imo_contact_model.dart';

class CuratorController extends GetxController {
  static CuratorController get instance => Get.find();

  final _curatorRepo = Get.put(CuratorRepository());

  getCuratorFromUid(String uid) {
    return _curatorRepo.getCuratorByUidRealtimeRepo(uid);
  }

  Stream<List<CuratorModel>> getAllCurator()  {
    return _curatorRepo.getAllCuratorRealTimeRepo();
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

}
