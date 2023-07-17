import 'package:GetSetGo_Holiday/app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GetSetGo_Holiday/app/modules/home/controller.dart';



class WinterPage extends GetView<HomeController> {
  const WinterPage({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFB596E5),
        title: Text('GetSetGo-Holiday'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

