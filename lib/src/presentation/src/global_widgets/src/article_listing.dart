import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:your_waste/your_waste.dart';

class ArticleListing extends StatefulWidget {
  const ArticleListing({
    super.key,
    this.isScrollable = false,
    this.minItems = 4,
  });

  final bool isScrollable;
  final int minItems;

  @override
  State<ArticleListing> createState() => _ArticleListingState();
}

class _ArticleListingState extends State<ArticleListing> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListArticleBloc, ListArticleState>(
      builder: (context, state) {
        if (state.listArticleStatus == ListArticleStatus.initial ||
            state.listArticleStatus == ListArticleStatus.refresh) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 48.0,
                      height: 48.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Container(
                            width: double.infinity,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Container(
                            width: 40.0,
                            height: 8.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              itemCount: widget.minItems,
            ),
          );
        }
        return ListView.separated(
          // padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: paddingSize),
          itemBuilder: (context, index) {
            final articleItem = ArticleItem(
              article: state.articles[index],
            );
            return widget.isScrollable
                ? (index >= state.articles.length
                    ? const LoadingIndicator()
                    : articleItem)
                : articleItem;
          },
          controller: widget.isScrollable ? _scrollController : null,
          separatorBuilder: (context, index) {
            return Divider(
              height: 2.h,
            );
          },
          itemCount: widget.isScrollable
              ? (state.hasReachedMax
                  ? state.articles.length
                  : state.articles.length + 1)
              : (state.articles.length >= widget.minItems
                  ? widget.minItems
                  : state.articles.length),
          physics:
              widget.isScrollable ? null : const NeverScrollableScrollPhysics(),
          shrinkWrap: widget.isScrollable == false ? true : false,
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      BlocProvider.of<ListArticleBloc>(context).add(ArticlesFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.8);
  }
}
