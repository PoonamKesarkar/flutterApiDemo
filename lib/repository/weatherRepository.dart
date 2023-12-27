import 'dart:convert';

import 'package:weatherapp/model/data_model.dart';

import 'package:http/http.dart' as http;

import '../network/api_constants.dart';
import '../network/api_response_exception.dart';
import '../network/internet_connection.dart';
import '../network/internet_connection_exception.dart';


class Repository {
  Future<MData?> getDataList() async {
    if (await isInternetConnected()) {
      var client = http.Client();
      try {
        var response = await client.get(
            Uri.https(ApiConstants.apiUrl, "entries")
        );
        if (response.statusCode == 200) {
          var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
          return MData.fromJson(jsonResponse);
        } else {
          throw APIResponseException("Api error");
        }
      } finally {
        client.close();
      }
    }else{
      throw InternetConnectionException();
    }
  }
}
