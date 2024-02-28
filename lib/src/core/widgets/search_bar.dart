import 'dart:developer';

import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/feature/library/data/cards_db.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatefulWidget {
  final BookCard card;

  const SearchBarWidget({
    super.key,
    required this.card,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final searchController = TextEditingController();
  final databaseHelper = CardsDatabase.instance;
  final String userSearchInput = '';
  bool doItJustOnce = false;
  List<BookCard> list = [];
  List<BookCard> filteredList = <BookCard>[];
  void filterList(String value) {
    setState(() {
      filteredList = list
          .where(
            (text) => text.title!.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
            child: TextFormField(
              style: TextStyles.inputText,
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.searchBackgroundColor,
                prefixIcon: const Icon(
                  Icons.search,
                ),
                prefixIconColor: AppColors.searchIconColor,
                hintText: 'Поиск',
                hintStyle: TextStyles.bottomButtonText
                    .copyWith(color: AppColors.searchIconColor),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                filterList(value);
                log(value);
              },
            ),
          ),
        ),
        Flexible(
          child: FutureBuilder(
            future: databaseHelper.readAllCards(),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.hasData) {
                if (!doItJustOnce) {
                  list = snapshot.data!;
                  filteredList = list;
                  doItJustOnce = !doItJustOnce;
                }
                return SizedBox();
                // return ListView.builder(
                //   itemCount: filteredList.length,
                //   itemBuilder: (context, index) {
                //     return CardWidget(
                //       card: widget.card,
                //     );
                //   },
                // );
              }
              return SizedBox();
              // return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
