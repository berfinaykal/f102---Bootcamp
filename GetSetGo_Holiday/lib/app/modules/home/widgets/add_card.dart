import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:GetSetGo_Holiday/app/core/utils/extensions.dart';
import 'package:GetSetGo_Holiday/app/core/values/colors.dart';
import 'package:GetSetGo_Holiday/app/data/models/task.dart';
import 'package:GetSetGo_Holiday/app/modules/home/controller.dart';
import 'package:GetSetGo_Holiday/app/widgets/icon.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.white, // Arka plan rengi beyaz
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0.wp),
            child: Text(
              'Task Type',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            key: homeCtrl.formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                  child: TextFormField(
                    controller: homeCtrl.formEditCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your task title';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0.wp),
                  child: Wrap(
                    spacing: 2.0.wp,
                    children: icons
                        .map(
                          (element) => Obx(
                            () {
                          final index = icons.indexOf(element);
                          return ChoiceChip(
                            selectedColor: Colors.grey[200],
                            pressElevation: 4,
                            backgroundColor: Colors.white,
                            label: element,
                            selected: homeCtrl.chipIndex.value == index,
                            onSelected: (bool selected) {
                              homeCtrl.chipIndex.value =
                              selected ? index : 0;
                            },
                          );
                        },
                      ),
                    )
                        .toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(150, 40),
                      ),
                      onPressed: () {
                        if (homeCtrl.formKey.currentState!.validate()) {
                          int icon =
                              icons[homeCtrl.chipIndex.value].icon!.codePoint;
                          String color =
                          icons[homeCtrl.chipIndex.value].color!.toHex();
                          var task = Task(
                            title: homeCtrl.formEditCtrl.text,
                            icon: icon,
                            color: color,
                          );
                          Get.back();
                          homeCtrl.addTask(task)
                              ? EasyLoading.showSuccess('Task Created')
                              : EasyLoading.showError('Task Already Exists');

                          homeCtrl.formEditCtrl.clear();
                          homeCtrl.changeChipIndex(0);
                        }
                      },
                      child: const Text("Confirm"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(150, 40),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
