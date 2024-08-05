import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/model/user_data_model.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/auth/approval/approval_screen.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/home_screen/examination/examination_screen.dart';
import 'package:rt_karate_academy/view/home_screen/home_screen.dart';

import '../../../util/functions.dart';

class ProfileCreationScreen extends StatelessWidget {
  ProfileCreationScreen(
      {super.key,
      required this.userName,
      required this.email,
      required this.password,
      required this.from});

  final String from;
  final String userName;
  final String email;
  final String password;
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
  String selectedGender = 'Male';
  String selectedOptBus = 'true';
  String selectedDojo = "Byculla Dojo (weekend)";

  @override
  Widget build(BuildContext context) {
    if (from == "update") {
      setUserValue();
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
                          "Let's Complete Your Profile",
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
                        //first row first name and middlename
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
                                  child: TextFormField(
                                    controller: firstNameController,
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
                                  child: TextFormField(
                                    controller: middleNameController,
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

                        //second row lastname and height

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
                                    child: TextFormField(
                                      controller: lastNameController,
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
                                    child: GestureDetector(
                                      onTap: () async {
                                        await _selectDate(context);
                                      },
                                      child: TextFormField(
                                        controller: dobController,
                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: "dd/mm/yyyy",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                        ),
                                      ),
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
                                    child: DropdownButtonFormField<String>(
                                      value: selectedGender,
                                      onChanged: (newValue) {
                                        selectedGender = newValue!;
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
                                    'Height (in cm)',
                                  ),
                                  SizedBox(
                                    child: TextFormField(
                                      controller: heightController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Your Height ',
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        //email id row
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 15),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       const Text(
                        //         'Email ID',
                        //       ),
                        //       SizedBox(
                        //         child: TextFormField(
                        //           controller: emailController,
                        //           decoration: InputDecoration(
                        //             hintText: 'Enter your email address',
                        //             hintStyle: TextStyle(
                        //               color: Colors.grey[400],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        //address field
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Address',
                              ),
                              SizedBox(
                                child: TextFormField(
                                  controller: addressController,
                                  minLines: 1,
                                  maxLines: 10,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your address',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
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
                                "Parent's/Guardian Name",
                              ),
                              SizedBox(
                                child: TextFormField(
                                  controller: parentNameController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your parent's name",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //dojo and bloodgroup row
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Choose Dojo'),
                                  SizedBox(
                                    child: DropdownButtonFormField<String>(
                                      value: selectedDojo,
                                      onChanged: (newValue) {
                                        selectedDojo = newValue!;
                                      },
                                      items: [
                                        'Byculla Dojo (weekend)',
                                        'Byculla Dojo (weekday)',
                                        'Shantikamal Dojo',
                                        'Nariman Point Dojo'
                                      ].map((option) {
                                        return DropdownMenuItem<String>(
                                          value: option,
                                          child: AutoSizeText(
                                            option,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        );
                                      }).toList(),
                                      decoration: const InputDecoration(),
                                    ),
                                  )
                                ],
                              )),
                              // Expanded(
                              //     child: Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     const Text(
                              //       'Dojo',
                              //     ),
                              //     SizedBox(
                              //       child: TextFormField(
                              //         controller: dojoController,
                              //         decoration: InputDecoration(
                              //           hintText: 'Enter Dojo',
                              //           hintStyle:
                              //               TextStyle(color: Colors.grey[400]),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Blood Group'),
                                  SizedBox(
                                    child: TextFormField(
                                      controller: bloodGroupController,
                                      decoration: InputDecoration(
                                        hintText: "Enter Blood Group",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        //opt for bus field
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Opt For Bus Service'),
                              SizedBox(
                                child: DropdownButtonFormField<String>(
                                  value: selectedOptBus,
                                  onChanged: (newValue) {
                                    selectedOptBus = newValue!;
                                  },
                                  items: ['true', 'false'].map((option) {
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
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlueCommonButton(
                          text: 'Submit',
                          onTap: () async {
                            // if (firstNameController.text.isEmpty ||
                            //     middleNameController.text.isEmpty ||
                            //     lastNameController.text.isEmpty ||
                            //     dobController.text.isEmpty ||
                            //     heightController.text.isEmpty ||
                            //     emailController.text.isEmpty ||
                            //     addressController.text.isEmpty ||
                            //     parentNameController.text.isEmpty ||
                            //     dojoController.text.isEmpty ||
                            //     bloodGroupController.text.isEmpty) {
                            //   Functions().showSnackBar(context,
                            //       'Please fill all the fields to continue');
                            //   return;
                            // }

                            try {
                              final userData = UserDataModel(
                                userName: userName,
                                email: email,
                                password: password,
                                firstName: firstNameController.text,
                                middleName: middleNameController.text,
                                lastName: lastNameController.text,
                                dob: dobController.text,
                                gender: selectedGender,
                                height: heightController.text,
                                address: addressController.text,
                                parentName: parentNameController.text,
                                dojo: dojoController.text,
                                bloodGroup: bloodGroupController.text,
                                optForBus: selectedOptBus,
                                approval: false,
                                beltLevel: '',
                                baseFee: '',
                                examFeeDue: 0,
                                incrementPerExam: '',
                                incrementPerYear: '',
                                uniformFeeDue: 0,
                                addedFee: 0.0,
                                joiningDate: DateTime.now().toIso8601String(),
                              );

                              await AuthServices.registerUser(userData);
                              // Navigate to the home screen or other screen upon success
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExaminationScreen()),
                              );
                            } catch (e) {
                              // Handle error (show error message, etc.)
                              print(e);
                            }

                            // await AuthServices.profileCreation(
                            //     userDataModel: UserDataModel(
                            //         userName: userName,
                            //         email:
                            //             emailController.text.toString().trim(),
                            //         password: password,
                            //         firstName: firstNameController.text
                            //             .toString()
                            //             .trim(),
                            //         middleName: middleNameController.text
                            //             .toString()
                            //             .trim(),
                            //         lastName: lastNameController.text
                            //             .toString()
                            //             .trim(),
                            //         dob: dobController.text.toString().trim(),
                            //         gender: selectedGender,
                            //         height:
                            //             heightController.text.toString().trim(),
                            //         address: addressController.text
                            //             .toString()
                            //             .trim(),
                            //         parentName: parentNameController.text
                            //             .toString()
                            //             .trim(),
                            //         dojo: selectedDojo,
                            //         bloodGroup: bloodGroupController.text
                            //             .toString()
                            //             .trim(),
                            //         optForBus: selectedOptBus,
                            //         approval: false,
                            //         beltLevel: 'white',
                            //         baseFee: '',
                            //         examFeeDue: 0,
                            //         incrementPerExam: '',
                            //         incrementPerYear: '',
                            //         uniformFeeDue: 0,
                            //         addedFee: 0.0,
                            //         joiningDate: Timestamp.now()));
                            // bool approvalStatus =
                            //     await AuthServices.approvalChecking(
                            //         email: email);

                            // approvalStatus
                            //     ? Navigator.of(context).pushReplacement(
                            //         MaterialPageRoute(
                            //             builder: (context) => HomeScreen()))
                            //     : Navigator.of(context).pushReplacement(
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 const UserApprovalScreen()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      dobController.text = Functions().dateTimeToString(picked, "dd/MM/yyyy");
    }
  }

  void setUserValue() {}
}
