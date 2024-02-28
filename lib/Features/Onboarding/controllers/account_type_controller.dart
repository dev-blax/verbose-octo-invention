import 'package:explore_larosa_mobile/Features/Authentication/screens/business_signup.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/login_screen.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/signup_screen.dart';
import 'package:get/get.dart';

class AccountTypeController extends GetxController {
  static AccountTypeController get instance => Get.find();

  void toBusinessRegistration() {
    Get.to(const BusinessSignupScreen());
  }

  void toPersonalRegistration() {
    Get.to(const SignupScreen());
  }

  void toSignIn() {
    Get.to(const LoginScreen());
  }
}
