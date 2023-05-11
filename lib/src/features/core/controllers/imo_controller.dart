import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:msa/src/features/core/models/imo_staff_model.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../repository/imo_repository/imo_repository.dart';
import '../../../repository/student_repository/student_repository.dart';
import '../../authentication/models/student_model.dart';
import '../models/imo_contact_model.dart';

class IMOController extends GetxController {
  static IMOController get instance => Get.find();


  final _imoRepo = Get.put(IMORepository());

  // @override
  // void onInit() {
  //   super.onInit();
  //   getIMOStaffData();
  // }

  getIMOStaffFromUid(String uid) {
    return _imoRepo.getIMOStaffByUidRealtime(uid);
  }

  Future<List<IMOStaffModel>> getAllIMOStaff() async {
    return await _imoRepo.getAllIMOStaffRepo();
  }

  getIMOContactFromUid(String uid) {
    return _imoRepo.getIMOContactByUidRealtime(uid);
  }

  Future<List<IMOContactModel>> getAllIMOContact() async {
    return await _imoRepo.getAllIMOContactRepo();
  }

}
