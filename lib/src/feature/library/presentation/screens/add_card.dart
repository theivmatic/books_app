import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_textformfield.dart';
import 'package:books_app/src/feature/library/presentation/widgets/card_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _genre = TextEditingController();
  final TextEditingController _publishedYear = TextEditingController();
  final TextEditingController _pagesQuantity = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _status = TextEditingController();
  final TextEditingController _pageBookmark = TextEditingController();
  final TextEditingController _comment = TextEditingController();

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
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
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
                child: Container(
                  width: 350.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12.r),
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
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
                    CustomTextFormField(
                      labelText: 'Стастус',
                      helperText: '',
                      controller: _status,
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
