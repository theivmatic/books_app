import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/feature/about_books/presentation/screens/article_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<dynamic>(
                  builder: (context) => const ArticleDetailsScreen(),
                ),
              );
            },
            child: Container(
              width: 350.w,
              height: 140.h,
              padding: EdgeInsets.all(
                20.dg,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/no_image.png',
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Статья',
                          style: TextStyles.labelText,
                        ),
                        Text(
                          '10 лучших книг 2023 года: версия «РБК Трендов»',
                          style: TextStyles.settingTileText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
