import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rt_karate_academy/model/exam_model.dart';

class ExamServices extends GetxController {
  Future<void> submitExamForm(
      ExamModel examModel, String email, String fee) async {
    var ref = FirebaseFirestore.instance.collection('examination');
    var id = ref.doc().id;
    examModel.id = id;
    await ref.doc(id).set(examModel.toMap());

    var userRef = FirebaseFirestore.instance
        .collection('Academy')
        .doc('Users')
        .collection('Profile')
        .doc(email);

    await userRef.update({"examFeeDue": FieldValue.increment(int.parse(fee))});
  }

  Future<Map<String, dynamic>> getExamFeeStructure() async {
    var ref = FirebaseFirestore.instance
        .collection('examination')
        .doc('exam-fee-structure');
    var doc = await ref.get();
    return doc.data() as Map<String, dynamic>;
  }
}
