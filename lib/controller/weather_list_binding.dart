
import 'package:get/get.dart';
import 'package:weatherapp/controller/weatherController.dart';

class WeatherListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController());
  }

}