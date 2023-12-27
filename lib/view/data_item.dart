import 'package:flutter/material.dart';
import 'package:weatherapp/model/data_model.dart';

class DataItem extends StatelessWidget {
  final WeatherData weatherData;
  const DataItem({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(weatherData.API??"",style: const TextStyle(fontSize: 14,color: Colors.black)),
      const SizedBox(height: 6,),
      Text(weatherData.description??"",style: const TextStyle(fontSize: 12,color: Colors.black45)),
      const SizedBox(height: 6,),
      Text(weatherData.Link??"",style: const TextStyle(fontSize: 12,color: Colors.black45)),
      const SizedBox(height: 6,),
    ]);
  }
}

