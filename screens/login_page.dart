import 'package:flutter/material.dart';
import 'package:restaurant_management/screens/table_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70,),
              CircleAvatar(
                backgroundColor: Colors.red,
                maxRadius: 50,
              ),
              SizedBox(height: 10,),
              Text('Ka và Cê', style: TextStyle(
                fontSize: 20
              ),),
              SizedBox(height: 300,),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/tables');
              }, child: Text('Welcome',style: TextStyle(
                fontSize: 35
              ),))
            ],
          ),
        ),
      ),
      );
  }
}
