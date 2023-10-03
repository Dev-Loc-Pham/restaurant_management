import 'package:flutter/material.dart';
import 'package:restaurant_management/data/bill_database.dart';
import 'package:restaurant_management/models/bill.dart';

import '../models/tables.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  List<Bill> list_receipt = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future fetch() async{
    final list_in_database = await BillDataHelper.getAll();

    setState(() {
      list_receipt = list_in_database;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly receipt'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: list_receipt.length,
            itemBuilder: (context,index){
          if(list_receipt.isEmpty){
            return Center(
              child: Text('nothing here'),
            );
          }else {
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red,),
              title: Container(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(list_receipt[index].name, style: TextStyle(
                  fontSize: 20
                ),),
                SizedBox(height: 5,),
                Text('total: ${list_receipt[index].total}'),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text('Giờ đến:${list_receipt[index].arrival}'),
                      SizedBox(width: 20,),
                      Text('Giờ đi:${list_receipt[index].leftover}'),
                    ],
                  )
              ],),),
            );
          }
        }),
      ),
    );
  }
}
