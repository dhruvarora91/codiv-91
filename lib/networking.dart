import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//urlIndia = 'https://api.thevirustracker.com/free-api?countryTotal=IN'
//urlWorld = 'https://api.thevirustracker.com/free-api?global=stats'

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
