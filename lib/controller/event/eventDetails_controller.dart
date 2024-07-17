import 'package:event_app/view/screen/Event/saves.dart';
import 'package:get/get.dart';

class eventDetailsController extends GetxController {
  final List<String> categories = [
    'Food',
    'Venus',
    'Games',
    'Planner',
  ];

  getResult() {
    Get.to(Saves_screen());
  }

  cancel() {
    Get.back();
  }
}
