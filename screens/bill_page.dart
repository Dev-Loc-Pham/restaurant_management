import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/models/dishes.dart';
import 'package:restaurant_management/provider/app_state.dart';
import 'package:restaurant_management/data/bill_database.dart';
import '../models/bill.dart';
import '../models/tables.dart';
import 'package:intl/intl.dart';
class BillPage extends StatefulWidget {
  const BillPage({super.key});
  static const routeName = '/billpage';

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    final agr = ModalRoute.of(context)!.settings.arguments as  Tables;
    List<Dish> menu = [];
    var appState = context.watch<AppState>();
    var total_bill = appState.totalBill(agr);
    for(Dish dish in agr.ds){
      if(dish.quantity >0){
        menu.add(dish);
      }
    }

    


    return Scaffold(
      appBar: AppBar(
        title: Text('Bills dcm'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 500,
              child: ListView.builder(
                  itemCount: appState.countDish(agr),
                  itemBuilder: (context, index){
                if(menu[index].quantity >0){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26,width: 6)
                      ),
                      child: ListTile(
                        leading: Image.network(menu[index].image),
                        title: Column(
                          children: [
                            Text('${menu[index].name} x ${menu[index].quantity}'),
                            Text(menu[index].price.toString()),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    ),
                  );
                }
              }),
            ),
            Divider(
              color: Colors.black,
              height: 9,
              thickness: 5,
            ),
            Row(
              children: [
                Text('Total:', style: TextStyle(
                  fontSize: 30
                ),),
                SizedBox(width: 10,),
                Text('${total_bill}đ',style: theme.textTheme.displayMedium)
              ],
            ),
            ElevatedButton(onPressed: (){
                agr.total = total_bill;
                DateTime now = DateTime.now();
                DateTime newdate = DateTime.utc(now.year,now.month,now.day, now.hour, now.minute+30);
                String datetime = DateFormat('kk:mm').format(now);
                String newdatetime = DateFormat(' kk:mm').format(newdate);
                Bill bill = Bill(name: agr.name, total: agr.total, arrival: datetime , leftover: newdatetime);
                print(bill);
                BillDataHelper.AddBill(bill);
                appState.clearDish(agr);
                appState.checked(agr.id);

                Navigator.pushNamed(context, '/tables');
            }, child: Text('Thanh Toán'))
          ],
        ),
      )
    );
  }
}
