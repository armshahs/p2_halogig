import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/controller/firebase_options.dart';
import 'package:rt_karate_academy/controller/home/fee/fee_services.dart';
import 'package:rt_karate_academy/view/auth/approval/approval_screen.dart';
import 'package:rt_karate_academy/view/auth/forgot_password/forgot_password_screen.dart';
import 'package:rt_karate_academy/view/auth/forgot_password/new_password_screen.dart';
import 'package:rt_karate_academy/view/auth/forgot_password/otp_verification_screen.dart';
import 'package:rt_karate_academy/view/auth/forgot_password/password_changed_screen.dart';
import 'package:rt_karate_academy/view/auth/login/login_screen.dart';
import 'package:rt_karate_academy/view/auth/profile_creation/profile_creation_screen.dart';
import 'package:rt_karate_academy/view/auth/register/register_screen.dart';
import 'package:rt_karate_academy/view/home_screen/attendance/attendance_screen.dart';
import 'package:rt_karate_academy/view/home_screen/bus_services/bus_services_screen.dart';
import 'package:rt_karate_academy/view/home_screen/change_password/change_password_screen.dart';
import 'package:rt_karate_academy/view/home_screen/event/event_view_screen.dart';
import 'package:rt_karate_academy/view/home_screen/event/events_screen.dart';
import 'package:rt_karate_academy/view/home_screen/examination/examination_screen.dart';
import 'package:rt_karate_academy/view/home_screen/fees/choose_month_screen.dart';
import 'package:rt_karate_academy/view/home_screen/fees/fees_screen.dart';
import 'package:rt_karate_academy/view/home_screen/gallery/gallery_screen.dart';
import 'package:rt_karate_academy/view/home_screen/holidays/holidays_screen.dart';
import 'package:rt_karate_academy/view/home_screen/home_screen.dart';
import 'package:rt_karate_academy/view/home_screen/notification/notification_screen.dart';
import 'package:rt_karate_academy/view/home_screen/online_revision/online_revision_screen.dart';
import 'package:rt_karate_academy/view/home_screen/order_status/order_status_screen.dart';
import 'package:rt_karate_academy/view/home_screen/support/support_screen.dart';
import 'package:rt_karate_academy/view/home_screen/switch_profile/swithc_profile.dart';
import 'package:rt_karate_academy/view/home_screen/uniform/cart_screen.dart';
import 'package:rt_karate_academy/view/home_screen/uniform/product_checkout_screen.dart';
import 'package:rt_karate_academy/view/home_screen/update_profile/update_profile.dart';
import 'package:rt_karate_academy/view/payment_option/approval_screen.dart';
import 'package:rt_karate_academy/view/payment_option/cash/cash_payment_screen.dart';
import 'package:rt_karate_academy/view/payment_option/online/online_payment_screen.dart';
import 'package:rt_karate_academy/view/payment_option/online/qr_code_screen.dart';
import 'package:rt_karate_academy/view/splash/splash_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Removing Firebase code below:
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // Register services with GET
  Get.put(AuthServices());
  Get.put(FeeServices());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
