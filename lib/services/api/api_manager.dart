import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/api/end_points.dart';
import 'package:movies_app/utils/constants.dart';

class ApiManager {

   static dynamic getData (String endPoint,Map<String,dynamic>data)async{

    Uri url = Uri.https(Constants.baseURL,endPoint,data);

    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    return jsonData;

  }



}