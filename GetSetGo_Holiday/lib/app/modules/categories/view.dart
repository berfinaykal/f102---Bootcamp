import 'package:GetSetGo_Holiday/app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GetSetGo_Holiday/app/modules/categories/autumn.dart';
import 'package:GetSetGo_Holiday/app/modules/categories/spring.dart';
import 'package:GetSetGo_Holiday/app/modules/categories/winter.dart';
import 'package:GetSetGo_Holiday/app/modules/categories/summer.dart';
import 'package:GetSetGo_Holiday/app/modules/home/controller.dart';

class Categories extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  Categories({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(4.0.wp),
            child: Text(
              'Select Category',
              style: TextStyle(
                color: Color(0xFF833BAA),
                fontSize: 15.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SpringPage()),
                  );
                },
                child: Image.asset(
                  'assets/img/spring.jpg',
                  height: 200.0,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SummerPage()),
                  );
                },
                child: Image.asset(
                  'assets/img/summer.jpg',
                  height: 200.0,
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WinterPage()),
                  );
                },
                child: Image.asset(
                  'assets/img/winter.jpg',
                  height: 200.0,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AutumnPage()),
                  );
                },
                child: Image.asset(
                  'assets/img/autumn.jpg',
                  height: 200.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

