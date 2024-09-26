
import 'package:crudoperation/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';


class Emoloyee extends StatefulWidget {
  const Emoloyee({super.key});

  @override
  State<Emoloyee> createState() => _EmoloyeeState();
}

class _EmoloyeeState extends State<Emoloyee> {
  TextEditingController nameController=new TextEditingController();
  TextEditingController ageController=new TextEditingController();
  TextEditingController locationController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Employee", style: TextStyle(color: Colors.blue,fontSize: 24.0,fontWeight: FontWeight.bold),),
            Text("Form", style: TextStyle(color: Colors.orange,fontSize: 24.0,fontWeight: FontWeight.bold),),
          ],
        ),
      ),

      body: Container(
        margin: EdgeInsets.only(left: 20.0,top: 30.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name",style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.bold),),
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

            Text("Age",style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.bold),),
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
           

            Text("Location",style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.bold),),
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
            SizedBox(height: 30,),

            Center(
              child: ElevatedButton(
  onPressed: () async {
    // Generate random alphanumeric ID
    String id = randomAlphaNumeric(10);

    // Creating employee information map
    Map<String, dynamic> employeeInfomap = {
      "name": nameController.text,
      "age": ageController.text,
      "Id": id, // Use the generated id here
      "location": locationController.text
    };

    // Create an instance of DatabaseMethod
    DatabaseMethod databaseMethod = DatabaseMethod();

    // Add employee details to the database
    await databaseMethod.addEmployeeDetails(employeeInfomap, id).then((value) {
      // Show toast on successful addition
      Fluttertoast.showToast(
        msg: "Employee added successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }).catchError((error) {
      // Show error toast if something goes wrong
      Fluttertoast.showToast(
        msg: "Error: $error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  },
  child: Text(
    'Add',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
)


            )
          ],
        ),
      ),
    );
  }
}