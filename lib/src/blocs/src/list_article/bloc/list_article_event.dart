part of 'list_article_bloc.dart';

@immutable
abstract class ListArticleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ArticlesFetched extends ListArticleEvent {
  final bool refresh;
  ArticlesFetched({this.refresh = false});
}
