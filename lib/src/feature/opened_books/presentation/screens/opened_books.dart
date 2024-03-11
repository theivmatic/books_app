import 'dart:convert';
import 'dart:developer';

import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
import 'package:books_app/src/feature/library/data/cards_db.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:books_app/src/feature/library/presentation/screens/add_card.dart';
import 'package:books_app/src/feature/library/presentation/widgets/card.dart';
import 'package:books_app/src/feature/opened_books/domain/bloc/opened_book_bloc.dart';
import 'package:books_app/src/feature/opened_books/presentation/widgets/opened_book.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpenedBooksScreen extends StatefulWidget {
  const OpenedBooksScreen({super.key});

  @override
  State<OpenedBooksScreen> createState() => _OpenedBooksScreenState();
}

class _OpenedBooksScreenState extends State<OpenedBooksScreen> {
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
  List<BookCard> selectedOpenedBooks = [];

  late SharedPreferences storage;

  Future<dynamic> getSharedPreferences() async {
    storage = await SharedPreferences.getInstance();
    readFromStorage();
    log('storage: $selectedOpenedBooks');
    setState(() {});
  }

  void saveToStorage() {
    final bookCardStringList = selectedOpenedBooks
        .map((bookCard) => jsonEncode(bookCard.toJson()))
        .toList();
    storage.setStringList('OpenedBookCards', bookCardStringList);
    setState(() {});
  }

  void readFromStorage() {
    final bookCardStringList = storage.getStringList('OpenedBookCards');

    if (bookCardStringList != null) {
      selectedOpenedBooks = bookCardStringList
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
    context.read<OpenedBookBloc>().add(
          const DisplayOpenedBooks(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Открытые книги',
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
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                icon: const Icon(
                                                  Icons.arrow_back_ios,
                                                  color: AppColors.yellow,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
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
                                                  .read<OpenedBookBloc>()
                                                  .add(
                                                    DisplayOpenedBooks(
                                                      openedBooks:
                                                          selectedOpenedBooks,
                                                    ),
                                                  );
                                              saveToStorage();
                                              Navigator.of(context).pop();
                                              log(
                                                selectedOpenedBooks.toString(),
                                              );
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
                                                        selectedOpenedBooks.add(
                                                          state.bookCard[index],
                                                        );
                                                      } else {
                                                        if (selectedOpenedBooks
                                                            .contains(
                                                          state.bookCard[index],
                                                        )) {
                                                          selectedOpenedBooks
                                                              .remove(
                                                            state.bookCard[
                                                                index],
                                                          );
                                                        }
                                                      }
                                                    },
                                                  ),
                                                  CardWidget(
                                                    card: state.bookCard[index],
                                                    onDelete: () {
                                                      context
                                                          .read<CardBloc>()
                                                          .add(
                                                            DeleteCardEvent(
                                                              id: state
                                                                      .bookCard[
                                                                          index]
                                                                      .id ??
                                                                  0,
                                                            ),
                                                          );
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
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
      body: BlocBuilder<OpenedBookBloc, OpenedBookBlocState>(
        builder: (context, state) => switch (state) {
          OpenedBookBlocInitialState() => const Center(
              child: CircularProgressIndicator(),
            ),
          OpenedBookBlocLoadedState() => Stack(
              children: [
                ListView.builder(
                  itemCount: state.openedBooks.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 65.h,
                          ),
                          OpenedBookWidget(
                            card: state.openedBooks[index],
                            //TODO: fix delete from list function
                            onDelete: () {
                              selectedOpenedBooks.remove(
                                selectedOpenedBooks[index],
                              );
                              saveToStorage();
                              // storage.reload();
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    }
                    return OpenedBookWidget(
                      card: state.openedBooks[index],
                      onDelete: () {
                        selectedOpenedBooks.remove(
                          selectedOpenedBooks[index],
                        );
                        // storage.reload();
                        saveToStorage();
                        setState(() {});
                        Navigator.of(context).pop();
                      },
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
                                  return OpenedBookWidget(
                                    card: filteredList[index],
                                    onDelete: () {
                                      Navigator.of(context).pop();
                                    },
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
              child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),
            ),
        },
      ),
    );
  }
}
