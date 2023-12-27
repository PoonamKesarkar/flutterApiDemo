import 'package:get/get.dart';
import 'package:weatherapp/repository/weatherRepository.dart';

import '../model/data_model.dart';
import '../network/api_response_exception.dart';
import '../network/internet_connection_exception.dart';

class WeatherController extends GetxController
    with StateMixin<List<WeatherData>> {

  @override
  onInit()  {
    super.onInit();
    getDataListApi();
  }

  Future<void> getDataListApi() async {
    try {
      Repository repository = Repository();
      MData? response = await repository.getDataList();
      if (response != null) {
        if (response.entries!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(response.entries, status: RxStatus.success());
        }
      }else{
        change(null, status: RxStatus.error('Something went wrong'));
      }
    } on APIResponseException catch (error) {
      change(null, status: RxStatus.error('$error'));
    } on InternetConnectionException catch (error) {
      change(null, status: RxStatus.error('$error'));
    }catch (error) {
      change(null, status: RxStatus.error('Something went wrong'));
    }
  }
}
