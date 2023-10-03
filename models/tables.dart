import 'package:restaurant_management/models/dishes.dart';

class Tables{
  int id;
  String name;
  double total;
  bool state;
  List<Dish> ds;
  DateTime ?arrivelTime;
  DateTime ?finishTime;
  Tables({required this.id,required this.name, required this.total,required this.state, this.arrivelTime, this.finishTime, required this.ds});


}