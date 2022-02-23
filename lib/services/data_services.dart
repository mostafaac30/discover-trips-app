import 'dart:convert';

import 'package:flutter_cubit/models/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getDataFromServer() async {
    String apiUrl = "/getplaces";

    http.Response response = await http.get(
      Uri.parse(baseUrl + apiUrl),
    );
    try {
      if (response.statusCode == 200) {
        /// get body of response / data
        /// transfer json body to List<mapssss> each map <string,dynamic>
        ///
        List<dynamic> jsonList = jsonDecode(response.body);

        /// json list is a list of mapsss
        return jsonList.map((oneMap) => DataModel.fromMap(oneMap)).toList();
      } else
        return <DataModel>[];
    } catch (e) {
      print(e.toString());

      return <DataModel>[];

      ///list of DataModel
    }
  }
}
