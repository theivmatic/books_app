import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
import 'package:books_app/src/feature/library/data/cards_db.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:books_app/src/feature/library/presentation/screens/add_card.dart';
import 'package:books_app/src/feature/library/presentation/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Твоя библиотека',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<dynamic>(
              builder: (context) => const AddCardScreen(),
            ),
          );
        },
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: BlocBuilder<CardBloc, CardBlocState>(
          builder: (context, state) {
            if (state is CardBlocInitialState) {
              context.read<CardBloc>().add(
                    const FetchCardsEvent(),
                  );
            }
            if (state is DisplayCards) {
              if (state.bookCard.isEmpty) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Нажмите на кнопку сверху, чтобы добавить карточку',
                      ),
                    ),
                  ],
                );
              } else {
                return Stack(
                  children: [
                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: state.bookCard.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 65.h,
                              ),
                              CardWidget(
                                card: state.bookCard[index],
                                onDelete: () {
                                  context.read<CardBloc>().add(
                                        DeleteCardEvent(
                                          id: state.bookCard[index].id ?? 0,
                                        ),
                                      );
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        }
                        return CardWidget(
                          card: state.bookCard[index],
                          onDelete: () {
                            context.read<CardBloc>().add(
                                  DeleteCardEvent(
                                    id: state.bookCard[index].id ?? 0,
                                  ),
                                );
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
                                      return CardWidget(
                                        card: filteredList[index],
                                        onDelete: () {
                                          context.read<CardBloc>().add(
                                                DeleteCardEvent(
                                                  id: state
                                                          .bookCard[index].id ??
                                                      0,
                                                ),
                                              );
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
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),
            );
          },
        ),
      ),
    );
  }
}
