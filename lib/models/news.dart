import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ArticleModel extends Equatable {
  final String id;
  final String title;
  final String author;
  final DateTime publishedAt;
  final String publisher;
  final String coverUrl;
  final String overview;

  const ArticleModel({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.publishedAt,
    @required this.publisher,
    @required this.coverUrl,
    @required this.overview
  });

  @override
  List<Object> get props => [
    id,
    title,
    author,
    publishedAt,
    publisher,
    coverUrl,
    overview
  ];

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      publishedAt: json['published_at'] != null ? DateTime.parse(json['publishedAt']) : null,
      overview: json['overview'],
      publisher: json['publisher'],
      coverUrl: json['cover_url'],
    );
  }
}
