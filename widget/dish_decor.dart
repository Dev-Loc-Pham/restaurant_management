import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/models/dishes.dart';

import '../models/tables.dart';
import '../provider/app_state.dart';

class DishDecor extends StatelessWidget {
  const DishDecor({super.key, required this.tables,required this.index});
  final Tables tables;
  final int index;

  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppState>();
    final List<Dish> dish = tables.ds;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width:2),
        borderRadius: BorderRadius.circular(20),
      ),
      
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          children: [
            ClipRRect(

              borderRadius: BorderRadius.circular(50),
              child: Image.network(dish[index].image)),
            Text(dish[index].name,style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold
            ),),
            Text('${dish[index].price}đ',style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                ElevatedButton(onPressed: (){
                  if(dish[index].quantity>0) {
                    appState.removeDish(dish[index].id,tables);
                  }
                }, child: Icon(Icons.remove_circle,size: 50),style: ElevatedButton.styleFrom(
                  minimumSize: Size(10, 20)
                ),),
                SizedBox(width: 10,),
                Text('${dish[index].quantity}',style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                  appState.addDish(dish[index].id, tables);
                }, child: Icon(Icons.add_circle,size: 50),style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  backgroundColor: Colors.pink[100]
                ),),
                SizedBox(width: 60,),
                IconButton(onPressed: (){
                  appState.deleteMenu(dish[index]);
                }, icon: Icon(Icons.delete_rounded,color: Colors.pinkAccent,size: 40,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
