import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addUser(
      {required Map<String, dynamic> userInfo, required String id}) async {
    await _firestore.collection("userData").doc(id).set(userInfo);
  }
}
