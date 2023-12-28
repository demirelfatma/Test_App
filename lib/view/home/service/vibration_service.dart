import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getVibrationData() async {
  var result = await FirebaseFirestore.instance.collection('vibration_data').get();
  // ignore: unnecessary_cast
  return result.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
}
