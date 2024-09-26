import 'package:crudoperation/pages/emoloyee.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Emoloyee()));
      },child: Icon(Icons.add),),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter", style: TextStyle(color: Colors.blue,fontSize: 24.0,fontWeight: FontWeight.bold),),
            Text("Firebase", style: TextStyle(color: Colors.orange,fontSize: 24.0,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Material(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: kamdem',style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),),
                      Text('Age: 20',style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),),
                      Text('Location: Dakar',style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            )
        ],),
      ),
    );
  }
}