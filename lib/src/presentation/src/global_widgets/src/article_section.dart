import 'package:flutter/material.dart';
import 'package:your_waste/your_waste.dart';

class ArticleSection extends StatelessWidget {
  const ArticleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubItemTitle(
          title: "Waste Management Education",
          trailing: InkWell(
            child: Text(
              "See all",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            onTap: () {
              context.read<AppBottomNavigationBarBloc>().add(
                    AppBottomNavigationBarChanged(
                      activePage: const ArticlesPage(),
                    ),
                  );
            },
          ),
        ),
        2.h.ph,
        const ArticleListing(),
      ],
    );
  }
}
