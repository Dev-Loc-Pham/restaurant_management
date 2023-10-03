import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/models/dishes.dart';
import 'package:restaurant_management/provider/app_state.dart';

import '../models/tables.dart';
import '../widget/dish_decor.dart';
import 'bill_page.dart';

class DishPage extends StatefulWidget {
  const DishPage({super.key, });
  static const routeName = '/dishpage';

  @override
  State<DishPage> createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  TextEditingController dish_id = TextEditingController();

  TextEditingController dish_name = TextEditingController();

  TextEditingController dish_price = TextEditingController();

  TextEditingController dish_image = TextEditingController();
  void clearText() {

    dish_id.clear();
    dish_name.clear();
    dish_price.clear();
    dish_image.clear();
  }
  @override
  Widget build(BuildContext context) {

    final agr = ModalRoute.of(context)!.settings.arguments as  Tables;
    var appState = context.watch<AppState>();
    var tableDishes = agr;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context,BillPage.routeName,arguments: tableDishes);
          }, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5
            ) ,

            itemCount: tableDishes.ds.length,
            itemBuilder:(context,index){
              var item = tableDishes;
              return DishDecor(tables: item, index: index,);
            } ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addNewMenu(context);
        },
        child: Icon(Icons.add),
      ),
    ) ;
  }

  Future<void> addNewMenu(BuildContext context){
    return showDialog(context: context, builder: (context) {
      var list_of_table = context.watch<AppState>();
      return AlertDialog(
        title: Text('addNewMenu'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text('ID'),
              SizedBox(height: 5,),
              TextField(
                controller: dish_id,
                decoration: InputDecoration(
                    hintText: 'id'
                ),
              ),
              SizedBox(height: 20,),
              Text('Name'),
              SizedBox(height: 5,),
              TextField(
                controller: dish_name,
                decoration: InputDecoration(
                    hintText: 'Name'
                ),
              ),
              SizedBox(height: 20,),
              Text('price'),
              SizedBox(height: 5,),
              TextField(
                controller: dish_price,
                decoration: InputDecoration(
                    hintText: 'price'
                ),
              ),
              SizedBox(height: 20,),
              Text('Image'),
              SizedBox(height: 5,),
              TextField(
                controller: dish_image,
                decoration: InputDecoration(
                    hintText: 'image'
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () {
            list_of_table.addMenu(Dish(id: int.parse(dish_id.text), name: dish_name.text, price: double.parse(dish_price.text), quantity: 0, image: dish_image.text));
            setState(() {
              clearText();
            });
            Navigator.pop(context);
          }, child: Text('Submit'))
        ],
      );
    }
    );
  }
}
