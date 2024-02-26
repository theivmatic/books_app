import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/bottom_button.dart';
import 'package:books_app/src/core/widgets/custom_textformfield.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:books_app/src/feature/library/presentation/screens/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCardScreen extends StatefulWidget {
  final BookCard? card;

  const EditCardScreen({
    super.key,
    required this.card,
  });

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  final _statusList = [
    'Не выбран',
    'Читаю',
    'Прочитана',
    'Неинтересно',
    'Хочу прочитать',
  ];
  String? _selectedStatus = 'Не выбран';

  @override
  Widget build(BuildContext context) {
    //Form controllers
    final newTitle = TextEditingController(text: widget.card?.title);
    final newAuthor = TextEditingController(text: widget.card?.author);
    final newGenre = TextEditingController(text: widget.card?.genre);
    final newPublishedYear =
        TextEditingController(text: widget.card?.publishedYear);
    final newPagesQuantity =
        TextEditingController(text: widget.card?.pagesQuantity);
    final newDescription =
        TextEditingController(text: widget.card?.description);
    final newPageBookmark =
        TextEditingController(text: widget.card?.pageBookmark);
    final newComment = TextEditingController(text: widget.card?.comment);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<CardBloc>().add(
                  const FetchCardsEvent(),
                );
            Navigator.of(context).pop();
          },
          icon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.yellow,
              size: 25.dg,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.card?.title ?? 'Наименование',
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
          if (state is DisplaySpecificCards) {
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
                        child: Stack(
                          children: [
                            Container(
                              width: 350.w,
                              height: 200.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Image.asset(
                                'assets/images/splash_image.png',
                                scale: 0.5,
                              ),
                            ),
                            Container(
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
                          ],
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
                        children: [
                          CustomTextFormField(
                            labelText: 'Наименование',
                            helperText: '',
                            controller: newTitle,
                          ),
                          CustomTextFormField(
                            labelText: 'Автор',
                            helperText: '',
                            controller: newAuthor,
                          ),
                          CustomTextFormField(
                            labelText: 'Жанр *',
                            helperText: 'Необязательно для заполнения',
                            controller: newGenre,
                          ),
                          CustomTextFormField(
                            labelText: 'Год издания *',
                            helperText: 'Необязательно для заполнения',
                            controller: newPublishedYear,
                          ),
                          CustomTextFormField(
                            labelText: 'Количество страниц *',
                            helperText: 'Необязательно для заполнения',
                            controller: newPagesQuantity,
                          ),
                          CustomTextFormField(
                            labelText: 'Описание *',
                            helperText: 'Необязательно для заполнения',
                            controller: newDescription,
                          ),
                          DropdownButtonFormField(
                            value: _selectedStatus,
                            borderRadius: BorderRadius.circular(12.r),
                            hint: Text(
                              'Не выбран',
                              style: TextStyles.inputText,
                            ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.grey,
                            ),
                            items: _statusList.map((e) {
                              return DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedStatus = value as String;
                              });
                            },
                          ),
                          CustomTextFormField(
                            labelText: 'Закладка на странице',
                            helperText: '',
                            controller: newPageBookmark,
                          ),
                          CustomTextFormField(
                            labelText: 'Комментарии',
                            helperText: 'Необязательно для заполнения',
                            controller: newComment,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          BlocBuilder<CardBloc, CardBlocState>(
                            builder: (context, state) {
                              return BottomButtonWidget(
                                onPressed: () {
                                  if (newTitle.text.isNotEmpty &&
                                      newAuthor.text.isNotEmpty &&
                                      newPageBookmark.text.isNotEmpty) {
                                    context.read<CardBloc>().add(
                                          UpdateCardEvent(
                                            updatedCard: BookCard(
                                              id: widget.card?.id,
                                              imagePath:
                                                  'assets/images/splash_image.png',
                                              title: newTitle.text,
                                              author: newAuthor.text,
                                              genre: newGenre.text,
                                              publishedYear:
                                                  newPublishedYear.text,
                                              pagesQuantity:
                                                  newPagesQuantity.text,
                                              description: newDescription.text,
                                              status: _selectedStatus,
                                              pageBookmark:
                                                  newPageBookmark.text,
                                              comment: newComment.text,
                                            ),
                                          ),
                                        );
                                    context.read<CardBloc>().add(
                                          const FetchCardsEvent(),
                                        );
                                    Navigator.of(context).pop(
                                      MaterialPageRoute<dynamic>(
                                        builder: (context) =>
                                            const LibraryScreen(),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration: const Duration(seconds: 3),
                                        content: Text(
                                          'Поля "Наименование", "Автор" и "Закладка на странице" должны быть заполнены, а также выбран статус',
                                          style: TextStyles.labelText.copyWith(
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                buttonText: 'Готово',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
