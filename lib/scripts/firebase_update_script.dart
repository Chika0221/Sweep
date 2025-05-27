// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateFirestoreField(
  CollectionName colName,
) async {
  // await FirebaseFirestore.instance
  //   .collection(colName.name)
  //   .doc('yourDocumentId')
  //   .update({
  //   'yourFieldName': 'newValue' // Replace with your field name and desired value
  // });
}

enum CollectionName {
  user,
  post,
}
