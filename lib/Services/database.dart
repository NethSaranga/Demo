import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/Models/appUsers.dart';
import 'package:my_app/Models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String userName, String nic, String phoneNumber, String age) async {
    return await userCollection.document(uid).setData({
      'userName': userName,
      'nic': nic,
      'phoneNumber': phoneNumber,
      'age': age,
    });
  }

  // app list from snapshot
  List<AppUsers> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return AppUsers(
          userName: doc.data['userName'] ?? '',
          nic: doc.data['nic'] ?? '',
          phoneNumber: doc.data['phoneNumber'] ?? '',
          age: doc.data['age'] ?? '');
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      userName: snapshot.data['userName'],
      nic: snapshot.data['nic'],
      phoneNumber: snapshot.data['phoneNumber'],
      age: snapshot.data['age'],
    );
  }

  // get app stream
  Stream<List<AppUsers>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
