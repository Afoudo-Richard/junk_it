import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, ArticleDetailPage.route(article));
      },
      child: CustomContainer(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        child: Row(
          children: [
            SizedBox(
              height: 10.h,
              width: 20.w,
              child: Image.asset(
                'JunkIt_logo'.toPng,
                fit: BoxFit.cover,
              ),
            ),
            1.w.pw,
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          article.title ?? "N/A",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      2.w.pw,
                      GestureDetector(
                        child: const Icon(
                          Icons.bookmark_border,
                        ),
                      ),
                    ],
                  ),
                  1.h.ph,
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[400],
                        size: 8.sp,
                      ),
                      1.w.pw,
                      Text(
                        "4.8",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 8.sp,
                        ),
                      ),
                      Text(
                        "(232 ratings)",
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
