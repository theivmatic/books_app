import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
// import 'package:books_app/src/core/widgets/search_bar.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/opened_books/presentation/widgets/opened_book.dart';
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
                onTap: () {},
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
