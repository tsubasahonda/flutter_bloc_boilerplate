import 'package:flutter_bloc_boilerplate/api/api_client.dart';
import 'package:flutter_bloc_boilerplate/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class NewsApi {
  Future<List<ArticleModel>> news();
}

class DefaultNewsApi extends NewsApi {
  ApiClient _apiClient;

  DefaultNewsApi(this._apiClient) : assert(_apiClient != null);

  @override
  Future<List<ArticleModel>> news() async {
    final http.Response response = await _apiClient.get("/news");
    return (jsonDecode(response.body) as List).map((it) => ArticleModel.fromJson(it)).toList();
  }
}