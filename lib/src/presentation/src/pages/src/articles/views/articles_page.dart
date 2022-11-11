import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ArticlesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Education",
        actions: [],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            2.h.ph,
            Expanded(
              child: BlocBuilder<ListArticleBloc, ListArticleState>(
                builder: (context, state) {
                  switch (state.listArticleStatus) {
                    case ListArticleStatus.initial:
                    case ListArticleStatus.refresh:
                      return const LoadingIndicator();
                    case ListArticleStatus.success:
                      return const ArticleListing(
                        isScrollable: true,
                      );
                    case ListArticleStatus.failure:
                      return Center(
                        child: SizedBox(
                          width: 100.w,
                          child: CustomButton(
                            backgroundColor: Colors.red,
                            onPressed: () {
                              BlocProvider.of<ListArticleBloc>(context).add(
                                ArticlesFetched(refresh: true),
                              );
                            },
                            child: Text(
                              "refresh",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
