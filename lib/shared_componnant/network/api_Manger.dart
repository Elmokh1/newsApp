import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_route/models/ArticalsModel.dart';
import 'package:news_app_route/models/source_model.dart';
import 'package:news_app_route/shared_componnant/Constants/Constants.dart';

class ApiManger {
  static Future<SourceModel> fetchRespons(String category) async{
    var query ={
      'apiKey' : Constants.apiKey,
      "category":category,
    };
    final response= await http.get(
      Uri.https(
        Constants.baseUrl,
        "/v2/top-headlines/sources",
        query,
      ),
    );

    var sourceData = SourceModel.fromJson(jsonDecode(response.body));
    debugPrint(response.body);

    if(response.statusCode==200 && jsonDecode(response.body)["status"]=="ok"){
      return sourceData;
    }else {
      throw Exception("Faild To load server");
    }
  }
  static Future<ArticalsModel> fetchNewsList(String source) async{

    var query  = {
      'apiKey' : Constants.apiKey,
      "sources":source,
    };
    var uri = Uri.https(
      Constants.baseUrl,
        "/v2/everything",
      query
    );
    final response = await http.get(uri);
    if(response.statusCode==200 && jsonDecode(response.body)["status"]=="ok"){
      var articls = ArticalsModel.fromJson(jsonDecode(response.body));
      return articls;
    }else {
      throw Exception("Faild To load articls");
    }
  }
}
