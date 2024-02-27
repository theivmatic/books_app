import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class OpenedBookWidget extends StatefulWidget {
  final BookCard card;

  const OpenedBookWidget({
    super.key,
    required this.card,
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
      padding: EdgeInsets.all(
        20.dg,
      ),
      child: InkWell(
        onTap: () {},
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
              currentStep: 50,
              minHeight: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
