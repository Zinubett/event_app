import 'package:event_app/view/screen/user/verification_screen.dart';
import 'package:get/get.dart';

class signUpController extends GetxController {
  onSignUp() {
    Get.off(Verification_screen());

    update();
  }

  onPressed() {
    update();
  }
}
