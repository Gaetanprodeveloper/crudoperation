import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod{
  Future addEmployeeDetails(Map<String,dynamic>employeeInfomap, String id)async{
   await FirebaseFirestore.
   instance.
   collection("Employee").
   doc(id).
   set(employeeInfomap);
  }

  Future<Stream<QuerySnapshot>> getEmployeesDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }
}