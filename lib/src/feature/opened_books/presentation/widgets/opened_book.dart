import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:books_app/src/feature/library/presentation/screens/card_details.dart';
import 'package:books_app/src/feature/library/presentation/screens/edit_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class OpenedBookWidget extends StatefulWidget {
  final BookCard card;
  final VoidCallback onDelete;

  const OpenedBookWidget({
    super.key,
    required this.card,
    required this.onDelete,
  });

  @override
  State<OpenedBookWidget> createState() => _OpenedBookWidgetState();
}

class _OpenedBookWidgetState extends State<OpenedBookWidget> {
  @override
  Widget build(BuildContext context) {
    final pages = widget.card.pagesQuantity;
    final pagesToInt = int.parse(pages ?? '');
    const hundred = 100;
    final bookmark = widget.card.pageBookmark;
    final bookmarkToInt = int.parse(bookmark ?? '');

    final percent = (bookmarkToInt / pagesToInt * hundred).toInt();
    final counter = '$percent%';

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<dynamic>(
              builder: (context) => CardDetailsScreen(
                card: widget.card,
              ),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 350.w,
              height: 190.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Image.asset(
                'assets/images/upload_image.png',
                scale: 0.5,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 10.h,
              right: 10.w,
              child: PopupMenuButton<Widget>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.keyboard_control_rounded,
                  color: AppColors.yellow,
                  size: 24.dg,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem<Widget>(
                    onTap: () {
                      context.read<CardBloc>().add(
                            FetchSpecificCardEvent(
                              id: widget.card.id ?? 0,
                            ),
                          );
                      Navigator.of(context).push(
                        MaterialPageRoute<dynamic>(
                          builder: (context) => EditCardScreen(
                            card: widget.card,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Редактировать',
                      style: TextStyles.popupItemText,
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<Widget>(
                    onTap: () {
                      showCupertinoDialog<Widget>(
                        barrierDismissible: true,
                        context: context,
                        builder: (_) => AlertDialog(
                          actionsAlignment: MainAxisAlignment.spaceEvenly,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.r,
                            ),
                          ),
                          title: Column(
                            children: [
                              Text(
                                'Вы уверены, что хотите удалить карточку?',
                                style: TextStyles.popupItemText,
                              ),
                              const Divider(),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: widget.onDelete,
                              child: Text(
                                'Удалить',
                                style: TextStyles.popupItemText.copyWith(
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Отмена',
                                style: TextStyles.popupItemText,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Удалить',
                      style: TextStyles.popupItemText.copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(10.dg),
                width: 350.w,
                height: 95.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      20.r,
                    ),
                    bottomRight: Radius.circular(
                      20.r,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.card.author ?? '',
                          style: TextStyles.labelText,
                        ),
                        Text(
                          widget.card.title ?? '',
                          style: TextStyles.settingTileText,
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          'Закладка на странице:',
                          style: TextStyles.labelText,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          counter,
                          style: TextStyles.labelText.copyWith(
                            color: AppColors.yellow,
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(widget.card.pageBookmark ?? '0'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            LinearProgressBar(
              progressColor: AppColors.yellow,
              backgroundColor: AppColors.grey,
              maxSteps: 100,
              currentStep: percent,
              minHeight: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
