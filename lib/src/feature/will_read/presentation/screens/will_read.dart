import 'dart:convert';
import 'dart:developer';

import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
import 'package:books_app/src/feature/library/data/cards_db.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:books_app/src/feature/library/presentation/screens/add_card.dart';
import 'package:books_app/src/feature/library/presentation/widgets/card.dart';
import 'package:books_app/src/feature/will_read/domain/bloc/will_read_bloc.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WillReadScreen extends StatefulWidget {
  const WillReadScreen({super.key});

  @override
  State<WillReadScreen> createState() => _WillReadScreenState();
}

class _WillReadScreenState extends State<WillReadScreen> {
  //RadioButton
  int? selectedValue;

  //Search
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

  //Strorage
  List<BookCard> selectedBooks = [];

  late SharedPreferences storage;

  Future<dynamic> getSharedPreferences() async {
    storage = await SharedPreferences.getInstance();
    readFromStorage();
    setState(() {});
  }

  void saveToStorage() {
    final bookCardStringList =
        selectedBooks.map((bookCard) => jsonEncode(bookCard.toJson())).toList();
    storage.setStringList('BookCards', bookCardStringList);
  }

  void readFromStorage() {
    final bookCardStringList = storage.getStringList('BookCards');

    if (bookCardStringList != null) {
      selectedBooks = bookCardStringList
          .map(
            (bookCard) => BookCard.fromJson(
              json.decode(bookCard) as Map<String, Object?>,
            ),
          )
          .toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    getSharedPreferences();
    context.read<WillReadBloc>().add(
          const DisplayWillReadBooks(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Прочитать в будущем',
        onPressed: () {
          showMenu<Widget>(
            context: context,
            position: const RelativeRect.fromLTRB(1, 0, 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
            items: [
              PopupMenuItem<Widget>(
                onTap: () {
                  context.read<CardBloc>().add(const FetchCardsEvent());
                  showCupertinoModalSheet<void>(
                    context: context,
                    builder: (context) {
                      return BlocBuilder<CardBloc, CardBlocState>(
                        builder: (context, state) {
                          if (state is DisplayCards) {
                            return Scaffold(
                              body: SingleChildScrollView(
                                physics: const ClampingScrollPhysics(),
                                child: Container(
                                  width: double.infinity,
                                  height: 1000.h,
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Wrap(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.arrow_back_ios,
                                                  color: AppColors.yellow,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'Назад',
                                                  style: TextStyles
                                                      .bottomSheetButtonText,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Выберите книгу',
                                            style:
                                                TextStyles.bottomSheetTitleText,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              context
                                                  .read<WillReadBloc>()
                                                  .add(
                                                    DisplayWillReadBooks(
                                                      willReadBooks:
                                                          selectedBooks,
                                                    ),
                                                  );
                                              saveToStorage();
                                              Navigator.of(context).pop();
                                              log(selectedBooks.toString());
                                            },
                                            child: Text(
                                              'Готово',
                                              style: TextStyles
                                                  .bottomSheetButtonText,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      SizedBox(
                                        height: 900.h,
                                        child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: state.bookCard.length,
                                          itemBuilder: (context, index) {
                                            return FittedBox(
                                              child: Row(
                                                children: [
                                                  Radio(
                                                    activeColor:
                                                        AppColors.yellow,
                                                    value: state
                                                        .bookCard[index].id,
                                                    groupValue: selectedValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedValue = value;
                                                      });
                                                      if (selectedValue ==
                                                          value) {
                                                        selectedBooks.add(
                                                          state.bookCard[index],
                                                        );
                                                      } else {
                                                        if (selectedBooks
                                                            .contains(
                                                          state.bookCard[index],
                                                        )) {
                                                          selectedBooks.remove(
                                                            state.bookCard[
                                                                index],
                                                          );
                                                        }
                                                      }
                                                    },
                                                  ),
                                                  CardWidget(
                                                    card: state.bookCard[index],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      );
                    },
                  );
                },
                child: Text(
                  'Добавить из библиотеки',
                  style: TextStyles.popupItemText,
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem<Widget>(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const AddCardScreen(),
                    ),
                  );
                },
                child: Text(
                  'Добавить новую книгу',
                  style: TextStyles.popupItemText.copyWith(
                    color: AppColors.yellow,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      backgroundColor: AppColors.backgroundColor,
      body:
          // const Center(
          //   child: Text('Will read'),
          // ),

          BlocBuilder<WillReadBloc, WillReadBlocState>(
        builder: (context, state) => switch (state) {
          WillReadBlocInitialState() => const Center(
              child: CircularProgressIndicator(),
            ),
            WillReadBlocLoadedState() => Stack(
              children: [
                ListView.builder(
                  itemCount: state.willReadBooks.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 65.h,
                          ),
                          CardWidget(
                            card: state.willReadBooks[index],
                          ),
                        ],
                      );
                    }
                    return CardWidget(
                      card: state.willReadBooks[index],
                    );
                  },
                ),
                Column(
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
                          onChanged: filterList,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: FutureBuilder(
                          future: databaseHelper.readAllCards(),
                          builder: (
                            context,
                            snapshot,
                          ) {
                            if (searchController.text.isNotEmpty) {
                              if (!doItJustOnce) {
                                list = snapshot.data!;
                                filteredList = list;
                                doItJustOnce = !doItJustOnce;
                              }
                              return ListView.builder(
                                itemCount: filteredList.length,
                                itemBuilder: (context, index) {
                                  return CardWidget(
                                    card: filteredList[index],
                                  );
                                },
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          _ => const Center(
              child: CircularProgressIndicator(),
            ),
        },
      ),
    );
  }
}
