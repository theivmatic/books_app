import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/bottom_button.dart';
import 'package:books_app/src/core/widgets/custom_textformfield.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/presentation/screens/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  //Form controllers
  final TextEditingController _title = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _genre = TextEditingController();
  final TextEditingController _publishedYear = TextEditingController();
  final TextEditingController _pagesQuantity = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _pageBookmark = TextEditingController();
  final TextEditingController _comment = TextEditingController();

  final _statusList = [
    'Не выбран',
    'Читаю',
    'Прочитана',
    'Неинтересно',
    'Хочу прочитать',
  ];
  String? _selectedValue = 'Не выбран';

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Наименование',
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
                      controller: _title,
                    ),
                    CustomTextFormField(
                      labelText: 'Автор',
                      helperText: '',
                      controller: _author,
                    ),
                    CustomTextFormField(
                      labelText: 'Жанр *',
                      helperText: 'Необязательно для заполнения',
                      controller: _genre,
                    ),
                    CustomTextFormField(
                      labelText: 'Год издания *',
                      helperText: 'Необязательно для заполнения',
                      controller: _publishedYear,
                    ),
                    CustomTextFormField(
                      labelText: 'Количество страниц *',
                      helperText: 'Необязательно для заполнения',
                      controller: _pagesQuantity,
                    ),
                    CustomTextFormField(
                      labelText: 'Описание *',
                      helperText: 'Необязательно для заполнения',
                      controller: _description,
                    ),
                    DropdownButtonFormField(
                      value: _selectedValue,
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
                          _selectedValue = value as String;
                        });
                      },
                    ),
                    CustomTextFormField(
                      labelText: 'Закладка на странице',
                      helperText: '',
                      controller: _pageBookmark,
                    ),
                    CustomTextFormField(
                      labelText: 'Комментарии',
                      helperText: 'Необязательно для заполнения',
                      controller: _comment,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocBuilder<CardBloc, CardBlocState>(
                      builder: (context, state) {
                        return BottomButtonWidget(
                          onPressed: () {
                            if (_title.text.isNotEmpty &&
                                _author.text.isNotEmpty &&
                                _pageBookmark.text.isNotEmpty) {
                              context.read<CardBloc>().add(
                                    AddCardEvent(
                                      imagePath:
                                          'assets/images/splash_image.png',
                                      title: _title.text,
                                      author: _author.text,
                                      genre: _genre.text,
                                      publishedYear: _publishedYear.text,
                                      pagesQuantity: _pagesQuantity.text,
                                      description: _description.text,
                                      status: _selectedValue,
                                      pageBookmark: _pageBookmark.text,
                                      comment: _comment.text,
                                    ),
                                  );
                              context.read<CardBloc>().add(
                                    const FetchCardsEvent(),
                                  );
                              Navigator.of(context).pop(
                                MaterialPageRoute<dynamic>(
                                  builder: (context) => const LibraryScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).clearSnackBars();
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
      ),
    );
  }
}
