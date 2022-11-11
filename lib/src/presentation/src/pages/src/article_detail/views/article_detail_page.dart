import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiffy/jiffy.dart';
import 'package:share_plus/share_plus.dart';
import 'package:your_waste/your_waste.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  static Route route(Article article) {
    return MaterialPageRoute<void>(
      builder: (_) => ArticleDetailPage(
        article: article,
      ),
    );
  }

  final Article article;

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  final _scrollController = ScrollController();
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        title: "Details",
        actions: [],
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                CustomContainer(
                  padding: EdgeInsets.zero,
                  backgroundColor: primaryColor,
                  width: 100.w,
                  height: 30.h,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: primaryColor,
                        color: secondaryColor,
                      ),
                    ),
                    imageUrl: "https://ui-avatars.com/api/?name=J+I",
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  widget.article.title ?? "N/A",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  Jiffy(widget.article.createdAt.toString())
                      .format("dd, MMMM yyyy"),
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF838589),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(widget.article.content ?? ""),
                // Html(
                //   data: widget.article.content,
                //   style: {
                //     // tables will have the below background color
                //     "img": Style(
                //       width: 100.w,
                //       height: 100.w,
                //     ),
                //     "h1": Style(
                //       fontSize: SizerUtil.deviceType == DeviceType.mobile
                //           ? FontSize.medium
                //           : FontSize.large,
                //     ),
                //     "p": Style(
                //       fontSize: SizerUtil.deviceType == DeviceType.mobile
                //           ? FontSize.medium
                //           : FontSize.large,
                //       margin:
                //           EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                //       // padding:
                //       //     EdgeInsets.symmetric(horizontal: 0, vertical: 2.h),
                //       display: Display.BLOCK,
                //     ),
                //   },
                //   customRenders: {
                //     iframe(): CustomRender.widget(
                //       widget: (RenderContext rContext, buildChildren) {
                //         var src = rContext.tree.attributes['src'];
                //         if (src != null) {
                //           String? videoId = YoutubePlayer.convertUrlToId(src);
                //           return YoutubePlayer(
                //             controller: YoutubePlayerController(
                //               initialVideoId: videoId ?? 'ULRhK1yq1cM',
                //               flags: const YoutubePlayerFlags(
                //                 autoPlay: false,
                //                 mute: false,
                //               ),
                //             ),
                //             showVideoProgressIndicator: true,
                //           );
                //         } else {
                //           return Container();
                //         }
                //       },
                //     ),
                //   },
                // ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        height: isVisible ? 40.sp : 0,
        duration: Duration(
          milliseconds: 400,
        ),
        child: CustomContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // articleDetailBottomNavBarItem(
              //   icon: LineIcons.prayingHands,
              //   value: "147",
              // ),
              // articleDetailBottomNavBarItem(
              //   icon: LineIcons.commentAlt,
              //   value: "3",
              // ),
              articleDetailBottomNavBarItem(
                icon: Icon(
                  Icons.share,
                  color: Colors.grey,
                  size: 20.sp,
                ),
                onTap: () {
                  // Share.share(
                  //   widget.article.absolute_url ?? "N/A",
                  //   subject: widget.article.title,
                  // );
                },
              ),
              // articleDetailBottomNavBarItem(
              //   icon: Icon(
              //     state.articleBlogInBookMark(widget.article)
              //         ? Icons.bookmark
              //         : Icons.bookmark_border_outlined,
              //     color: state.articleBlogInBookMark(widget.article)
              //         ? primaryColor
              //         : Colors.grey,
              //     size: 20.sp,
              //   ),
              //   onTap: () {
              //     state.articleBlogInBookMark(widget.article)
              //         ? BlocProvider.of<BookMarkBloc>(context).add(
              //             BookMarkarticleRemoved(article: widget.article))
              //         : BlocProvider.of<BookMarkBloc>(context).add(
              //             BookMarkarticleAdded(article: widget.article));
              //   },
              // ),
            ],
          ),
        ),
      ),
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
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      showBottonNavBar();
    } else if (direction == ScrollDirection.reverse) {
      hideBottonNavBar();
    }
  }

  void showBottonNavBar() {
    if (!isVisible)
      setState(() {
        isVisible = true;
      });
  }

  void hideBottonNavBar() {
    if (isVisible)
      setState(() {
        isVisible = false;
      });
  }
}

class articleDetailBottomNavBarItem extends StatelessWidget {
  const articleDetailBottomNavBarItem({
    Key? key,
    required this.icon,
    this.value,
    this.onTap,
  }) : super(key: key);

  final Widget icon;
  final String? value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          Text(
            value ?? "",
            style: TextStyle(fontSize: 9.sp),
          )
        ],
      ),
    );
  }
}
