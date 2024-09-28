import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod{
  Future addEmployeeDetails(Map<String,dynamic>employeeInfomap, String id)async{
  return
   await FirebaseFirestore.
   instance.
   collection("Employee").
   doc(id).
   set(employeeInfomap);
  }

  Future<Stream<QuerySnapshot>> getEmployeesDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  Future updateEmployeedetails(String id, Map<String,dynamic>updateinfo) async{
    return await FirebaseFirestore.instance.collection('Employee').doc(id).update(updateinfo);
  }

  Future deleteEmployeeDetails(String id,)async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).delete();
  }
}