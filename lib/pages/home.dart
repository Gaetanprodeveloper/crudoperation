import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudoperation/pages/emoloyee.dart';
import 'package:crudoperation/service/database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream?EmployeeStram;

  TextEditingController nameController=new TextEditingController();
  TextEditingController ageController=new TextEditingController();
  TextEditingController locationController=new TextEditingController();

  getontheload()async{
    EmployeeStram=await DatabaseMethod().getEmployeesDetails();

    setState(() {
      
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getontheload();
  }

  Widget allEmployeeDetails(){
    return StreamBuilder(stream: EmployeeStram, builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData?
      ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context,index){
       DocumentSnapshot ds=snapshot.data.docs[index];
       return 
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: Material(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          
                          children: [
                            Text('Name: '+ds["name"],style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                nameController.text=ds["name"];
                                ageController.text=ds["age"];
                                locationController.text=ds["location"];
                                EditEmployeeDetails(ds["Id"]);
                              },
                              child: Icon(Icons.edit,color: Colors.blue,)),
                              SizedBox(width: 10.0,),
                              GestureDetector(
                                onTap: () async{
                               await DatabaseMethod().deleteEmployeeDetails(ds["Id"]);
                                },
                                child: Icon(Icons.delete,color: Colors.red,))
                          ],
                        ),
                        Text('Age: '+ds["age"],style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),),
                        Text('Location: '+ds["location"],style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
        );
      }):Container();
    });
  }
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
           Expanded(child: allEmployeeDetails())
        ],),
      ),
    );
  }

  Future EditEmployeeDetails(String id)=> showDialog(context: context, builder: (context)=>
    AlertDialog(
    content: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector(
                  onTap: (){
                  Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel),

          
                  
          
                ),
                SizedBox(height: 60,),
                 Text("Edit", style: TextStyle(color: Colors.blue,fontSize: 24.0,fontWeight: FontWeight.bold),),
              Text("Details", style: TextStyle(color: Colors.orange,fontSize: 24.0,fontWeight: FontWeight.bold),),
          
              ],),
              SizedBox(height: 20,),
          
               Text("Name",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
               SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                  
                ),
              ),
              SizedBox(height: 20,),
          
              Text("Age",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
               SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
                child: TextField(
                   controller: ageController,
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                  
                ),
              ),
              SizedBox(height: 20,),
             
          
              Text("Location",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
               SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                  
                ),
              ),
              SizedBox(height: 20,),
             
             Center(
               child: ElevatedButton(onPressed: () async{
                Map<String,dynamic>updateinfo={
                "name":nameController.text,
                "age":ageController.text,
                "Id":id,
                "location":locationController.text
                };
          
                await DatabaseMethod().updateEmployeedetails(id, updateinfo).then((value){
                 Navigator.pop(context);
                });
               }, child: Text("Update")),
             )
            ],
          ),
        ),
    ),
    )
  );
}