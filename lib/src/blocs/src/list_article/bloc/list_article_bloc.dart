import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:your_waste/your_waste.dart';
import 'package:stream_transform/stream_transform.dart';

part 'list_article_event.dart';
part 'list_article_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class ListArticleBloc extends Bloc<ListArticleEvent, ListArticleState> {
  ListArticleBloc() : super(ListArticleState()) {
    on<ArticlesFetched>(_onArticlesFetched,
        transformer: debounce(
          _duration,
        ));
  }

  void _onArticlesFetched(
    ArticlesFetched event,
    Emitter<ListArticleState> emit,
  ) async {
    if (!event.refresh) {
      if (state.hasReachedMax) return;
    }
    try {
      if (state.listArticleStatus == ListArticleStatus.initial ||
          event.refresh) {
        if (event.refresh) {
          emit(state.copyWith(
            listArticleStatus: ListArticleStatus.refresh,
          ));
        }
        final articles = await _fetchArticles();

        return emit(state.copyWith(
          listArticleStatus: ListArticleStatus.success,
          articles: articles,
          hasReachedMax: false,
        ));
      }

      final articles = await _fetchArticles(startIndex: state.articles.length);

      emit(
        articles.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                listArticleStatus: ListArticleStatus.success,
                articles: List.of(state.articles)..addAll(articles),
                hasReachedMax: false,
              ),
      );
    } catch (_) {
      emit(state.copyWith(listArticleStatus: ListArticleStatus.failure));
    }
  }

  Future<List<Article>> _fetchArticles({int startIndex = 0}) async {
    QueryBuilder<Article> query = QueryBuilder(Article());
    query.setAmountToSkip(startIndex);
    query.orderByDescending('createdAt');
    query.setLimit(10);

    return query.find();
  }
}
