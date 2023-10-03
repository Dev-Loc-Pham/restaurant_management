import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/provider/app_state.dart';
import 'package:restaurant_management/screens/dish_page.dart';

import '../models/tables.dart';

class TableDecor extends StatelessWidget {
  const TableDecor({super.key, required this.table});
    final Tables table;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return InkWell(
      onTap: (){
          Navigator.pushNamed(context, DishPage.routeName,arguments: table);
          appState.checked(table.id);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width:2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(table.name,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  SizedBox(width: 70,),
                  CircleAvatar(
                    backgroundColor: table.state? Colors.green : Colors.red,
                    radius: 6,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
