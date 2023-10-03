import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/list_models/list_dish.dart';
import 'package:restaurant_management/list_models/list_table.dart';
import 'package:restaurant_management/provider/app_state.dart';
import 'package:restaurant_management/screens/receipt_page.dart';
import 'package:restaurant_management/widget/table_decor.dart';

import '../models/dishes.dart';
import '../models/tables.dart';
class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  TextEditingController table_id = TextEditingController();
  TextEditingController table_name = TextEditingController();

  @override
  void clearText() {

    table_id.clear();
    table_name.clear();
  }
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    var tables = appState.tables;
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Page'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReceiptPage()));
          }, icon: Icon(Icons.receipt))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3/2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5
            ) ,

            itemCount: tables.length,
            itemBuilder:(context,index){
              var item = tables[index];
            return TableDecor(table: item);
        } ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: (){
            buildDialog(context);
          },child: Icon(Icons.add_circle),),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: (){

            appState.removeTable();

          },child: Icon(Icons.remove_circle),),
        ],
      ),
    ) ;
  }
  Future<void> buildDialog(BuildContext context){
    List<Dish> new_list_dish = MyListDish.InsertDishinList();
    List<Tables> list_of_table = context.read<AppState>().tables;
    return showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('New Table'),
      content: Column(
        children: [
          Text('ID'),
          SizedBox(height: 10,),
          TextField(
            controller: table_id,
            decoration: InputDecoration(
              hintText: 'id'
            ),
          ),
          SizedBox(height: 20,),
          Text('Name'),
          SizedBox(height: 10,),
          TextField(
            controller: table_name,
            decoration: InputDecoration(
                hintText: 'Name'
            ),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: (){
          list_of_table.add(Tables(
            id: int.parse(table_id.text),
            name: table_name.text,
            total: 0,
            state: true,
            ds: new_list_dish
          ));
          setState(() {
            clearText();
          });
          Navigator.pop(context);
        }, child: Text('Submit'))
      ],
    ));
  }

}

