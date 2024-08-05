import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/controller/home/examination/exam_services.dart';
import 'package:rt_karate_academy/model/exam_model.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/util/functions.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController middleNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController dobController = TextEditingController();

  final TextEditingController heightController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController parentNameController = TextEditingController();

  final TextEditingController dojoController = TextEditingController();

  final TextEditingController bloodGroupController = TextEditingController();

  final TextEditingController examDateController = TextEditingController();

  String selectedGender = 'Male';

  String selectedCurrentBelt = "";

  String selectedGoingForBelt = "";

  String selectedOptBus = 'Yes';

  var belts = [
    "white",
    "yellow",
    "orange",
    "blue",
    "darkBlue",
    "green",
    "purple",
    "brown",
    "brown1",
    "brown2",
    "black"
  ];

  var authController = Get.find<AuthServices>();

  @override
  Widget build(BuildContext context) {
    var formObj = ExamModel.fromJson({});

    selectedCurrentBelt = authController.user.value.beltLevel;
    formObj.currentBelt = selectedCurrentBelt;
    var index = belts.indexOf(selectedCurrentBelt) == belts.length - 1
        ? belts.length - 1
        : belts.indexOf(selectedCurrentBelt) + 1;
    selectedGoingForBelt = belts[index];
    formObj.goingForBelt = selectedGoingForBelt;
    formObj.gender = selectedGender;

    firstNameController.text = authController.user.value.firstName;
    formObj.firstName = authController.user.value.firstName;
    formObj.email = authController.user.value.email;
    middleNameController.text = authController.user.value.middleName;
    formObj.middleName = authController.user.value.middleName;
    lastNameController.text = authController.user.value.lastName;
    formObj.lastName = authController.user.value.lastName;
    dobController.text = authController.user.value.dob;
    formObj.dob = authController.user.value.dob;
    heightController.text = authController.user.value.height;
    formObj.height = authController.user.value.height;

    Future<String> getExamFee() async {
      var feeStructure = await ExamServices().getExamFeeStructure();
      return feeStructure[selectedGoingForBelt]!;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: backgroundGradient,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    BackCommonButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Form",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //first row first name and middle name
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'First Name',
                                ),
                                SizedBox(
                                  height: 35,
                                  child: TextFormField(
                                    enabled: false,
                                    controller: firstNameController,
                                    onChanged: (value) {
                                      formObj.firstName = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'First Name',
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                              ],
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Middle Name'),
                                SizedBox(
                                  height: 35,
                                  child: TextFormField(
                                    controller: middleNameController,
                                    enabled: false,
                                    onChanged: (value) {
                                      formObj.middleName = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Middle Name",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),

                        //second row last name and height

                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Last Name',
                                  ),
                                  SizedBox(
                                    height: 35,
                                    child: TextFormField(
                                      enabled: false,
                                      controller: lastNameController,
                                      onChanged: (value) {
                                        formObj.lastName = value;
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Last Name',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                ],
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Date of Birth'),
                                  SizedBox(
                                    height: 35,
                                    child: TextFormField(
                                      enabled: false,
                                      controller: dobController,
                                      onChanged: (value) {
                                        formObj.dob = value;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "dd/mm/yyyy",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          suffixIcon: Icon(
                                            Icons.lock,
                                            size: 20,
                                            color: Colors.grey[400],
                                          )),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),

                        //gender and height row
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Choose Gender'),
                                  SizedBox(
                                    height: 40,
                                    child: DropdownButtonFormField<String>(
                                      value: selectedGender,
                                      onChanged: (newValue) {
                                        selectedGender = newValue!;
                                        formObj.gender = newValue;
                                      },
                                      items: ['Male', 'Female'].map((option) {
                                        return DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                          ),
                                        );
                                      }).toList(),
                                      decoration: const InputDecoration(),
                                    ),
                                  )
                                ],
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Height',
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      enabled: false,
                                      controller: heightController,
                                      onChanged: (value) {
                                        formObj.height = value;
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Enter Your Height',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          suffixIcon: Icon(
                                            Icons.lock,
                                            size: 20,
                                            color: Colors.grey[400],
                                          )),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        //email id row
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Current Belt',
                              ),
                              SizedBox(
                                height: 45,
                                child: DropdownButtonFormField<String>(
                                  value: selectedCurrentBelt,
                                  onChanged: (newValue) {
                                    formObj.currentBelt = newValue!;
                                  },
                                  items: belts.map((option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(
                                        option,
                                      ),
                                    );
                                  }).toList(),
                                  decoration: const InputDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //address field
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Going For',
                              ),
                              SizedBox(
                                height: 45,
                                child: DropdownButtonFormField<String>(
                                  value: selectedGoingForBelt,
                                  onChanged: (newValue) {
                                    selectedGoingForBelt = newValue!;
                                    formObj.goingForBelt = newValue;
                                  },
                                  items: belts.map((option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(
                                        option,
                                      ),
                                    );
                                  }).toList(),
                                  decoration: const InputDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //parent name field
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Examination",
                              ),
                              SizedBox(
                                height: 35,
                                child: TextFormField(
                                  onTap: () {
                                    _selectDate(context, formObj);
                                  },
                                  controller: examDateController,
                                  readOnly: true,
                                  onChanged: (value) {
                                    formObj.examDate = Functions()
                                        .stringToDateTime(value, "dd/MM/yyyy");
                                  },
                                  decoration: InputDecoration(
                                      hintText:
                                          "date of examination (dd/MM/yyyy)",
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                      suffixIcon: Icon(
                                        Icons.lock,
                                        size: 20,
                                        color: Colors.grey[400],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 50,
                        ),
                        BlueCommonButton(
                          text: 'Submit',
                          onTap: () async {
                            // print(formObj);
                            await ExamServices().submitExamForm(
                                formObj,
                                authController.user.value.email,
                                (await getExamFee()));
                            Fluttertoast.showToast(msg: "Form Submitted");
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  String? onlyDate = "";

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, ExamModel formObj) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      examDateController.text =
          Functions().dateTimeToString(picked, "dd/MM/yyyy");
      formObj.examDate = picked;
    }
  }
}
