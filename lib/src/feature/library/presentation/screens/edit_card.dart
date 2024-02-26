import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
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
  @override
  Widget build(BuildContext context) {

    //Form controllers
    final TextEditingController _newTitle =
        TextEditingController(text: widget.card?.title);
    final TextEditingController _newAuthor =
        TextEditingController(text: widget.card?.author);
    final TextEditingController _newGenre =
        TextEditingController(text: widget.card?.genre);
    final TextEditingController _newPublishedYear =
        TextEditingController(text: widget.card?.publishedYear);
    final TextEditingController _newPagesQuantity =
        TextEditingController(text: widget.card?.pagesQuantity);
    final TextEditingController _newDescription =
        TextEditingController(text: widget.card?.description);
    final TextEditingController _newPageBookmark =
        TextEditingController(text: widget.card?.pageBookmark);
    final TextEditingController _newComment =
        TextEditingController(text: widget.card?.comment);

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
            return const Column();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
