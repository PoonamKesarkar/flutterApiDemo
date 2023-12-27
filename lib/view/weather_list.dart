import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/weatherController.dart';
import 'data_item.dart';

class WeatherList extends GetView<WeatherController> {
  const WeatherList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Api Data"),
      ),
      body: Center(
        child: controller.obx(
              (state) => ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>  const Divider(color: Colors.blue, height: 1.0),
              itemCount: state == null ? 0 : state.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return DataItem( weatherData:state![index]);
              }),
          onLoading: const CircularProgressIndicator(),
          onEmpty: const Text('No data found'),
          onError: (error) => Text(error??"Something went wrong"),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
