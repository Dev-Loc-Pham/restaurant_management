import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/list_models/list_table.dart';
import 'package:restaurant_management/models/tables.dart';
import 'package:restaurant_management/list_models/list_dish.dart';

import '../models/dishes.dart';


class AppState extends ChangeNotifier {
  List<Tables> tables = listOfTable;
  List<List<Dish>> dishes = MyListDish.totalListDish;

  void checked(int id) {
    int index = tables.indexWhere((element) => element.id == id);
    tables[index].state = !tables[index].state;
    notifyListeners();
  }
// table functions
  void addTable(Tables newtable){
    tables.add(newtable);
    dishes.add(newtable.ds);
    notifyListeners();
  }
  void removeTable(){
    tables.removeLast();
    notifyListeners();
  }
  double totalBill(Tables table) {
    double total_bill = 0;
    var mainDish = table.ds;
    for(int i =0; i< mainDish.length; i++)
    {
      if(mainDish[i].quantity >0){
        total_bill += mainDish[i].price * mainDish[i].quantity;
      }

    }
    return total_bill;
  }

  // menu function
  void addMenu(Dish dish){
    for (Tables table in tables){
        table.ds.add(dish);

    }
    notifyListeners();
  }
  void deleteMenu(Dish dish){
    for (Tables table in tables){
      table.ds.remove(dish);
    }
    notifyListeners();
  }

  void addDish(int id, Tables table){
    var mainDish = table.ds;
    int index = mainDish.indexWhere((element) => element.id == id);
    mainDish[index].quantity++;


    notifyListeners();
  }
  void removeDish(int id, Tables table){
    var mainDish = table.ds;
    int index = mainDish.indexWhere((element) => element.id == id);
    mainDish[index].quantity--;
    notifyListeners();
  }

  void clearDish( Tables table){
    var mainDish = table.ds;
    for(Dish dish in mainDish){
      dish.quantity =0;
    }
    notifyListeners();
  }

  int countDish(Tables table){
    int count_dish = 0;
    for(Dish i in table.ds){
      if( i.quantity >0){
        count_dish++;
      }
    }
    return count_dish;
  }


}

