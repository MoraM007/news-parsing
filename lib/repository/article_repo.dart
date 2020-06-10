import 'package:flutterappjson/models/api_result.dart';
import 'package:flutterappjson/resources/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ArticleRepo {

  Future<List<Articles>> getArticles();
}

class ArticleRepoImp implements ArticleRepo {
  @override
  Future<List<Articles>> getArticles() async {
    var response = await http.get(AppStrings.BaseUrl);
    if(response.statusCode == 200) {
      var data =  json.decode(response.body);
      List<Articles> articles = ApiResult.fromJson(data).articles;
      return articles;
    } else {
      throw Exception();
    }
  }
}