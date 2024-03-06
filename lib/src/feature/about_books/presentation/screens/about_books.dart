import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
import 'package:books_app/src/feature/about_books/domain/bloc/about_books_bloc.dart';
import 'package:books_app/src/feature/about_books/presentation/widgets/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutBooksScreen extends StatefulWidget {
  const AboutBooksScreen({super.key});

  @override
  State<AboutBooksScreen> createState() => _AboutBooksScreenState();
}

class _AboutBooksScreenState extends State<AboutBooksScreen> {
  @override
  void initState() {
    context.read<AboutBooksBloc>().add(
          FetchArticlesEvent(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'О книгах',
        onPressed: () {},
      ),
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<AboutBooksBloc, AboutBooksBlocState>(
        builder: (context, state) => switch (state) {
          AboutBooksBlocLoadedState() => ListView.builder(
              itemCount: state.articlesLoaded.articles?.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      ArticleWidget(
                        article: state.articlesLoaded,
                        title: state.articlesLoaded.articles?[index].title ?? 'Название статьи',
                      ),
                    ],
                  );
                } else {
                  return ArticleWidget(
                    article: state.articlesLoaded,
                    title: state.articlesLoaded.articles?[index].title ?? 'Название статьи',
                  );
                }
              },
            ),
          _ => const Center(
              child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),
            ),
        },
      ),
    );
  }
}
