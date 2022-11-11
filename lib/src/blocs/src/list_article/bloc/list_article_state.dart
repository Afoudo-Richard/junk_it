// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'list_article_bloc.dart';

enum ListArticleStatus { initial, success, failure, refresh }

class ListArticleState extends Equatable {
  final List<Article> articles;
  final ListArticleStatus listArticleStatus;
  final bool hasReachedMax;

  ListArticleState({
    this.articles = const <Article>[],
    this.listArticleStatus = ListArticleStatus.initial,
    this.hasReachedMax = false,
  });

  @override
  List<Object> get props => [articles, listArticleStatus, hasReachedMax];

  ListArticleState copyWith({
    List<Article>? articles,
    ListArticleStatus? listArticleStatus,
    bool? hasReachedMax,
  }) {
    return ListArticleState(
      articles: articles ?? this.articles,
      listArticleStatus: listArticleStatus ?? this.listArticleStatus,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
