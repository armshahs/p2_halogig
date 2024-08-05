import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rt_karate_academy/model/user_data_model.dart';
import 'package:rt_karate_academy/constants/global_variables.dart';

class AuthServices extends GetxController {
  var user = UserDataModel(
          userName: "",
          email: "",
          password: "",
          firstName: "",
          middleName: "",
          lastName: "",
          dob: "",
          gender: "",
          height: "",
          address: "",
          parentName: "",
          dojo: "",
          bloodGroup: "",
          optForBus: "",
          approval: false,
          beltLevel: "",
          baseFee: '',
          examFeeDue: 0,
          incrementPerExam: '',
          incrementPerYear: '',
          uniformFeeDue: 0,
          addedFee: 0.0,
          joiningDate: DateTime.now().toIso8601String())
      .obs;

  // Adding new backend code. STARTS here ---------------------------
  //-----------------------------------------------------------------
  //-----------------------------------------------------------------

  // Register a new user
  static Future<void> registerUser(UserDataModel userDataModel) async {
    final url = '$uri/api/auth/register';

    // Convert UserDataModel to JSON
    final body = json.encode(userDataModel.toJson());

    try {
      // Perform POST request
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode != 201) {
        print('Registration failed: ${response.body}');
        throw Exception('Failed to register user');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  //Login with email and password
  var bearerToken = ''.obs;

  static Future<void> login(String email, String password) async {
    final url = '$uri/api/auth/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // print(response.body);
      // print('success------------------');
      final token =
          data['token']; // Assuming the token is returned with this key

      // Format token for storage
      final tokenValue = 'Bearer $token';

      // Save token to local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('Authorization', tokenValue);

      // Save token to GetX state management
      Get.find<AuthServices>().bearerToken.value = tokenValue;
    } else {
      throw Exception('Failed to login');
    }
  }

  // Adding new backend code. ENDS here -----------------------------
  //-----------------------------------------------------------------
  //-----------------------------------------------------------------

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // // Register screen -- NOT REQUIRED
  //register with mail and password
  static Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  changePassword(String currentPassword, String newPassword) async {
    var res = await _auth.currentUser?.reauthenticateWithCredential(
        EmailAuthProvider.credential(
            email: _auth.currentUser!.email!,
            password: currentPassword // The user's current password
            ));
    print(res);
    await res?.user?.updatePassword(newPassword);
    print("updated");
  }

  //create profile while register
  static Future<void> profileCreation(
      {required UserDataModel userDataModel}) async {
    final userDoc = FirebaseFirestore.instance
        .collection('Academy')
        .doc('Users')
        .collection('Profile')
        .doc(userDataModel.email);

    final json = userDataModel.toJson();
    await userDoc.set(json);
  }

  //get current userr data
  static Future<UserDataModel> getCurrentUserData(
      {required String email}) async {
    final doc = await FirebaseFirestore.instance
        .collection('Academy')
        .doc('Users')
        .collection('Profile')
        .doc(email)
        .get();

    return UserDataModel.fromJson(doc.data()!);
  }

  //login with mail and password
  static Future<UserCredential> signin(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //approval checking
  static Future<bool> approvalChecking({required String email}) async {
    final doc = await FirebaseFirestore.instance
        .collection('Academy')
        .doc('Users')
        .collection('Profile')
        .doc(email)
        .get();
    if (doc.exists && doc['approval'] == true) {
      print('status approved');
      return true;
    } else {
      print('status not approved');
      return false;
    }
  }

  getUsersFromLocal() {}
}
