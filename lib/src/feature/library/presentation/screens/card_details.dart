import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:books_app/src/feature/library/presentation/widgets/card_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDetailsScreen extends StatefulWidget {
  final BookCard card;

  const CardDetailsScreen({
    super.key,
    required this.card,
  });

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.yellow,
              size: 25.dg,
            ),
          ),
        ),
        backgroundColor: AppColors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.card.title ?? '',
              style: TextStyles.appbarTitleText,
            ),
            Text(
              'Твоя библиотека',
              style: TextStyles.labelText,
            ),
          ],
        ),
        centerTitle: false,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<CardBloc, CardBlocState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.dg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardDetailWidget(
                          label: 'Название',
                          content: widget.card.title ?? '',
                        ),
                        CardDetailWidget(
                          label: 'Aвтор',
                          content: widget.card.author ?? '',
                        ),
                        CardDetailWidget(
                          label: 'Жанр',
                          content: widget.card.genre ?? '',
                        ),
                        CardDetailWidget(
                          label: 'Год издания',
                          content: widget.card.publishedYear ?? '',
                        ),
                        CardDetailWidget(
                          label: 'Количество страниц',
                          content: widget.card.pagesQuantity ?? '',
                        ),
                        CardDetailWidget(
                          label: 'Описание',
                          content: widget.card.description ?? '',
                        ),
                        CardDetailWidget(
                          label: 'Статус',
                          content: widget.card.status ?? '',
                        ),
                        CardDetailWidget(
                          label: 'Закладка на странице',
                          content: widget.card.pageBookmark ?? '',
                        ),
                        CardDetailWidget(
                          label: 'Комментарии',
                          content: widget.card.comment ?? '',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
