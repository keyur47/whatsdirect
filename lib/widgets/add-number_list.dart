

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whatsdirect/helper/shared_preferences.dart';
import 'package:whatsdirect/modules/controller/controller.dart';

class AddList extends StatefulWidget {
   AddList({Key? key}) : super(key: key);

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  Controller controller = Get.find();

  String dataType = "";

   @override
   void initState() {
     super.initState();
     getData();
   }

   getData() async {
      controller.tempList = await SharedPrefs.getNumberList();
       setState(() {
      controller.tempList.add(controller.myController.text);
       });
       print("------------>>> ${controller.tempList}");
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
           itemCount: controller.tempList.length,
          itemBuilder: ((context, index) {
        return Text("${controller.tempList[index]}");
      } )),
    );
  }
}






























































































































































































































































































































































































// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:whatsdirect/modules/controller/controller.dart';
// import 'package:whatsdirect/widgets/model.dart';
//
// class AddList extends StatefulWidget {
//   const AddList({Key? key}) : super(key: key);
//
//   @override
//   State<AddList> createState() => _AddListState();
// }
//
// class _AddListState extends State<AddList> {
//   Controller controller = Get.find();
//
//   List<List<GraphInfo>> list = [];
//
//   final List<List<GraphInfo>> defaultList = [
//     [
//       GraphInfo(number: "8155734",),
//
//     ],
//
//     // [
//     //   GraphInfo(number: 'dgdfg', code: "dg"),
//     //   GraphInfo(number: 'dfgd', code: "dfg"),
//     // ],
//     // [
//     //   GraphInfo(number: 'dgdfg', code: "dg"),
//     //   GraphInfo(number: 'dfgd', code: "dfg"),
//     // ],
//     // [
//     //   GraphInfo(number: 'dgdfg', code: "dg"),
//     //   GraphInfo(number: 'dfgd', code: "dfg"),
//     // ],
//   ];
//
//   @override
//   void initState() {
//     addToSP(defaultList).then((_) => getSP());
//     super.initState();
//   }
//
//   Future<void> addToSP(List<List<GraphInfo>> tList) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('graphLists', jsonEncode(tList));
//   }
//
//   void getSP() async {
//     final prefs = await SharedPreferences.getInstance();
//     final List<dynamic> jsonData =
//         jsonDecode(prefs.getString('graphLists') ?? '[]');
//     list = jsonData.map<List<GraphInfo>>((jsonList) {
//       return jsonList.map<GraphInfo>((jsonItem) {
//         return GraphInfo.fromJson(jsonItem);
//       }).toList();
//     }).toList();
//     setState(() {});
//   }
//
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: list.isNotEmpty
//             ? Center(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: list.map((subList) {
//                     return subList.isNotEmpty
//                         ? Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children:
//                                 subList.map((x) => Text(x.number)).toList(),
//                           )
//                         : const Text('Empty subList');
//                   }).toList(),
//                 ),
//               )
//             : const Text('NOTHING'),
//       ),
//     );
//   }
// }
