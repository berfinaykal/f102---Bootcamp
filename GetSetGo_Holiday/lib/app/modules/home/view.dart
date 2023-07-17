import 'package:GetSetGo_Holiday/app/core/utils/extensions.dart';
import 'package:GetSetGo_Holiday/app/modules/home/widgets/add_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GetSetGo_Holiday/app/modules/home/controller.dart';
import 'package:GetSetGo_Holiday/app/modules/home/widgets/task_card.dart';

import '../../core/values/colors.dart';
import '../categories/view.dart';
import '../report/view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFB596E5),
        leading: Icon(Icons.menu),
        title: Text('GetSetGo-Holiday'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: Obx(
            () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0.wp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Lists',
                          style: TextStyle(
                            color: Color(0xFF833BAA),
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.dialog(
                              AddCard(),
                              barrierDismissible: false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFB596E5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text('Create New List'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: false,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        if (controller.tasks.length >= 2) ...controller.tasks.map(
                              (element) => LongPressDraggable(
                            data: element,
                            onDragStarted: () => controller.changeDeleting(true),
                            onDraggableCanceled: (velocity, offset) =>
                                controller.changeDeleting(false),
                            onDragEnd: (details) => controller.changeDeleting(false),
                            feedback: Opacity(
                              opacity: 0.5,
                              child: TaskCard(task: element),
                            ),
                            child: TaskCard(task: element),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ReportPage(),
            Categories(),
          ],
        ),
      ),
      floatingActionButton: null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Color(0xFFB596E5),
          highlightColor: Color(0xFFB596E5),
        ),
        child: Obx(
              () => BottomNavigationBar(
            backgroundColor: Color(0xFFB596E5),
            onTap: (int index) => controller.changeTabIndex(index),
            currentIndex: controller.tabIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: darkGreen,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Report',
                icon: Icon(Icons.data_usage),
              ),
              BottomNavigationBarItem(
                label: 'Categories',
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
      ),
    );
  }
}