import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/institute_repository/institute_repository.dart';

class InstituteController extends GetxController {

  static InstituteController get instance => Get.find();

  // final InstituteRepository _repository = InstituteRepository();
  final _repository = Get.put(InstituteRepository());
  final RxList<String> groups = RxList<String>();

  @override
  void onInit() {
    super.onInit();
    fetchGroups();
  }

  Future<void> fetchGroups() async {
    final results = await _repository.getInstituteGroups();
    groups.addAll(results);
  }
}