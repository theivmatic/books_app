import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
// import 'package:books_app/src/core/widgets/search_bar.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/presentation/widgets/card.dart';
import 'package:books_app/src/feature/opened_books/presentation/widgets/opened_book.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenedBooksScreen extends StatelessWidget {
  const OpenedBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Открытые книги',
        onPressed: () {
          showMenu(
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
                            return Container(
                              width: double.infinity,
                              height: 1000.h,
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                              ),
                              child: Column(
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
                                        style: TextStyles.bottomSheetTitleText,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Готово',
                                          style:
                                              TextStyles.bottomSheetButtonText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  // ListView.builder(
                                  //   itemBuilder: (context, index) {
                                  //     return CardWidget(
                                  //       card: state.bookCard[index],
                                  //     );
                                  //   },
                                  // ),
                                ],
                              ),
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      );
                    },
                  );
                  // showBottomSheet<void>(
                  //   enableDrag: true,
                  //   context: context,
                  //   builder: (context) {
                  //     return Container(
                  //       width: 350,
                  //       height: 350,
                  //       decoration: BoxDecoration(
                  //         color: AppColors.red,
                  //       ),
                  //     );
                  //   },
                  // );
                },
                child: Text(
                  'Добавить из библиотеки',
                  style: TextStyles.popupItemText,
                ),
              ),
              PopupMenuItem<Widget>(
                onTap: () {},
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
      body: BlocBuilder<CardBloc, CardBlocState>(
        builder: (context, state) {
          if (state is CardBlocInitialState) {
            context.read<CardBloc>().add(
                  const FetchCardsEvent(),
                );
          }
          if (state is DisplayCards) {
            if (state.bookCard.isEmpty) {
              return const Center(
                child: Text(
                  'Нажмите на кнопку сверху, чтобы добавить карточку',
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.bookCard.length,
                itemBuilder: (context, index) {
                  return OpenedBookWidget(
                    card: state.bookCard[index],
                  );
                },
              );
            }
          }
          return const Center();
        },
      ),
    );
  }
}
