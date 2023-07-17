import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:GetSetGo_Holiday/app/core/utils/extensions.dart';
import 'package:GetSetGo_Holiday/app/modules/home/controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../widgets/doing_list.dart';
import '../../widgets/done_list.dart';

class SpringDetail extends GetView<HomeController> {
  final List<String> defaultItems = [
    'Tablecloth',
    'Fork',
    'Knife',
    'Spoon',
    'Cup',
  ];

  SpringDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFB596E5),
        title: Text('GetSetGo-Holiday'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
              controller.updateTodo();
              controller.changeTask(null);
              controller.formEditCtrl.clear();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                ),
                Icon(
                  Icons.shopping_basket,
                ),
                SizedBox(width: 8.0),
                Text(
                  'picnic',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0),
            child: Row(
              children: [
                Obx(
                      () {
                    var totalTodos =
                        controller.doingTodos.length + controller.doneTodos.length;
                    return Text(
                      '$totalTodos Tasks',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFB596E5),
                      ),
                    );
                  },
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Obx(
                        () {
                      var totalTodos =
                          controller.doingTodos.length + controller.doneTodos.length;
                      return StepProgressIndicator(
                        totalSteps: totalTodos == 0 ? 1 : totalTodos,
                        currentStep: controller.doneTodos.length,
                        size: 5,
                        padding: 0,
                        selectedGradientColor: LinearGradient(
                          colors: [
                            controller.getTaskColor()?.withOpacity(0.5) ??
                                Colors.transparent,
                            controller.getTaskColor() ?? Colors.transparent,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        unselectedGradientColor: LinearGradient(
                          colors: [
                            Colors.grey[300]!,
                            Colors.grey[400]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextFormField(
              controller: controller.formEditCtrl,
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple[400]!),
                ),
                prefixIcon: Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.deepPurple[400],
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (controller.formEditCtrl.text.isNotEmpty) {
                      controller.addTodo(controller.formEditCtrl.text);
                      controller.formEditCtrl.clear();
                    }
                  },
                  icon: Icon(Icons.done),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your todo item';
                }
                return null;
              },
            ),
          ),
          ...defaultItems.map(
                (item) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Checkbox(
                    value: controller.containTodo(
                      controller.doingTodos,
                      item,
                    ),
                    onChanged: (value) {
                      if (value != null && value) {
                        controller.addTodo(item);
                      } else {
                        controller.deleteDoneTodo(item);
                      }
                    },
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    item,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          DoingList(),
          DoneList(),
        ],
      ),
    );
  }
}
