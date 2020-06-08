import 'package:flutter_bloc_boilerplate/models/news.dart';
import 'package:flutter_bloc_boilerplate/api/news_api.dart';

class NewsRepository {
  final NewsApi _newsApi;

  NewsRepository(this._newsApi) : assert(_newsApi != null);

  Future<List<ArticleModel>> getNews() => _newsApi.news();
}