import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:GetSetGo_Holiday/app/data/services/storage/services.dart';
import 'package:GetSetGo_Holiday/app/modules/home/binding.dart';
import 'LoginPage.dart';


void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPa(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
