import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/feature/about_books/domain/models/article_entity.dart';
import 'package:books_app/src/feature/about_books/presentation/widgets/article_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final ArticleEntity article;

  const ArticleDetailsScreen({
    super.key,
    required this.article,
  });

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.article.articles?[0].title ?? '',
              style: TextStyles.appbarTitleText,
            ),
            Text(
              'О книгах',
              style: TextStyles.labelText,
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.yellow,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.dg),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 350.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Image.asset(
                      'assets/images/upload_image.png',
                      scale: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white,
              ),
              child: SizedBox(
                height: 500.h,
                child: ListView.builder(
                  itemCount: widget.article.articles?[0].items?.length,
                  itemBuilder: (context, index) => ArticleDetailWidget(
                    title:
                        widget.article.articles?[0].items?[index].title ?? '',
                    content:
                        widget.article.articles?[0].items?[index].text ?? '',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
