import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GetSetGo_Holiday/app/modules/home/controller.dart';


class AutumnPage extends GetView<HomeController> {
  const AutumnPage({Key? key}) : super(key: key);

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

