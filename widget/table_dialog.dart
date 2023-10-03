//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../list_models/list_dish.dart';
// import '../models/dishes.dart';
// import '../models/tables.dart';
// import '../provider/app_state.dart';
//
// Future<void> buildDialog(BuildContext context, TextEditingController table_id, TextEditingController table_name){
//   List<Dish> new_list_dish = List.from(MyListDish.listOfMainDish);
//   List<Tables> list_of_table = context.read<AppState>().tables;
//   return showDialog(context: context, builder: (context) => AlertDialog(
//     title: Text('New Table'),
//     content: Column(
//       children: [
//         Text('ID'),
//         SizedBox(height: 10,),
//         TextField(
//           controller: table_id,
//           decoration: InputDecoration(
//               hintText: 'id'
//           ),
//         ),
//         SizedBox(height: 20,),
//         Text('Name'),
//         SizedBox(height: 10,),
//         TextField(
//           controller: table_name,
//           decoration: InputDecoration(
//               hintText: 'Name'
//           ),
//         ),
//       ],
//     ),
//     actions: [
//       TextButton(onPressed: (){
//         list_of_table.add(Tables(
//             id: int.parse(table_id.text),
//             name: table_name.text,
//             total: 0,
//             state: true,
//             ds: new_list_dish
//         ));
//         setState(() {
//
//         });
//         Navigator.pop(context);
//       }, child: Text('Submit'))
//     ],
//   ));
// }